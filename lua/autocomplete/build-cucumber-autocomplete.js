const { resolve } = require('path');
const { readdir, readFile, writeFile } = require('fs').promises;

async function getFiles(dir) {
    const dirents = await readdir(dir, { withFileTypes: true });
    const files = await Promise.all(dirents.map((dirent) => {
        const res = resolve(dir, dirent.name);
        return dirent.isDirectory() ? getFiles(res) : res;
    }));
    return Array.prototype.concat(...files);
}

async function extractSteps(filePath) {
    return readFile(filePath, { encoding: 'utf-8' })
        .then(text => text.toString().split('\n'))
        .then(lines => {
            return lines
                .filter(line =>
                    line.startsWith('Given') ||
                    line.startsWith('When') ||
                    line.startsWith('Then')
                )
                .map(line => /^.*?'(.*?)'/.exec(line)?.at(1))
                .filter(line => line != null)
                .map(line => line.replaceAll('{string}', "''"))
        });
}

getFiles('/home/afoster/code/epm-data-wpe-automation/cypress/e2e/steps')
    .then((files) => {
        return Promise.all(files.map(f => extractSteps(f)));
    })
    .then(steps => steps.flat().sort())
    .then(steps => writeFile('./cucumber-steps.json', JSON.stringify(steps)));
