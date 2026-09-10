--- @module 'blink.cmp'
--- @class blink.cmp.Source
local source = {}

local function read_file(path)
	local file = io.open(path, "r") -- r read mode and b binary mode
	if not file then
		error("File not found:" .. path)
	end
	local content = file:read("*a") -- *a or *all reads the whole file
	file:close()
	return content
end

function source.new(opts)
	local self = setmetatable({}, { __index = source })
	self.opts = opts
	return self
end

function source:enabled()
	return vim.bo.filetype == "cucumber"
end

function source:get_trigger_characters()
	return { ".", " " }
end

function source:get_completions(ctx, callback)
    -- don't overwrite existing lines
	if string.len(ctx["line"]) > 10 then
		return function() end
	end

    -- only autocomplete if line starts keyword
	if
		not (
			string.match(ctx["line"], "^%s*Given")
			or string.match(ctx["line"], "^%s*When")
			or string.match(ctx["line"], "^%s*Then ")
			or string.match(ctx["line"], "^%s*And")
		)
	then
		return function() end
	end

	local json = require("json")

	local fileContent = read_file("/home/afoster/.config/barebones/lua/autocomplete/cucumber-steps.json")

	if fileContent == nil then
		error("No steps found in JSON file")
	end

	local steps = json.decode(fileContent)

	local items = {}

	local line = ctx["bounds"]["line_number"] - 1
	local character = ctx["bounds"]["start_col"] - 1

	for i = 1, #steps do
		local step = steps[i]
		local item = {
			label = step,
			kind = require("blink.cmp.types").CompletionItemKind.Snippets,
			filterText = step,
			textEdit = {
				newText = step,
				range = {
					-- 0-indexed line and character, end-exclusive
					start = { line = line, character = character },
					["end"] = { line = line, character = 999 },
				},
			},
			insertTextFormat = vim.lsp.protocol.InsertTextFormat.Text,
		}

		table.insert(items, item)
	end

	callback({
		items = items,
		is_incomplete_backward = true,
		is_incomplete_forward = true,
	})

	-- (Optional) Return a function which cancels the request
	-- If you have long running requests, it's essential you support cancellation
	return function() end
end


-- (Optional) Called immediately after applying the item's textEdit/insertText
-- Only useful when you want to customize how items are accepted,
-- beyond what's possible with `textEdit` and `additionalTextEdits`
function source:execute(ctx, _, callback, default_implementation)
	-- When you provide an `execute` function, your source must handle the execution
	-- of the item itself, but you may use the default implementation at any time
	default_implementation()

	-- The callback _MUST_ be called once
	callback()

    local line = vim.api.nvim_get_current_line()
    local x, _ = string.find(line, "'")
    if x ~= nil then
        local y = vim.fn.getcurpos()[2]
        vim.fn.cursor({y, x + 1})
    end
end

return source
