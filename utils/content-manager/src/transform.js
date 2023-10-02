#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const process = require("process");
const glob = require("glob");
const yargs = require("yargs");
const yamljs = require("yamljs")
const nunjucks = require("nunjucks");

getPath = (file) => {
  return path.join(process.cwd(), file);
}

globber = (folder, pattern, callback) => {
  const matched = glob.sync(path.join(folder, pattern));
  for (const match of matched) {
    callback(match);
  }
}

ensureFileExists = (filePath) => {
  if (!fs.existsSync(filePath)) {
    console.log('File does not exist: ', filePath);
    process.exit(1);
  }
}

getGlobContents = (glob) => {
  var contents = '';
  if (glob.lastIndexOf('*') != -1) {
    globber(".", glob, (m) => {
      var filePath = getPath(m);
      ensureFileExists(filePath);
      contents += fs.readFileSync(filePath).toString();
    });
  } else if (glob.lastIndexOf(',') != -1) {
    var parts = glob.split(',');
    for (const part of parts) {
      var filePath = getPath(part);
      ensureFileExists(filePath);
      contents += fs.readFileSync(filePath).toString();
    }
  } else {
    console.log('Invalid parameter: ', glob);
    process.exit(1);
  }
  return contents;
}

transform = (template, input) => {
  var inputYaml = yamljs.parse(input);
  return nunjucks.renderString(template, inputYaml);
}

processTransformOutput = (result, outputPath, stdout) => {
  var outputFile = getPath(outputPath);
  if (!stdout) {
    fs.writeFileSync(outputFile, result);
  } else {
    console.log(result);
  }
}

transformFile = (templatePath, inputPath, outputPath, stdout) => {
  var templateFile = getPath(templatePath);
  var template = fs.readFileSync(templateFile).toString();
  var inputFile = getPath(inputPath);
  var input = fs.readFileSync(inputFile).toString();
  var result = transform(template, input);
  processTransformOutput(result, outputPath, stdout);
}

globTransform = (args) => {
  if (!fs.existsSync(args.template) && !fs.existsSync(args.input)) {
    var superTemplate = getGlobContents(args.template);
    var superInput = getGlobContents(args.input);
    var result = transform(superTemplate, superInput);
    processTransformOutput(result, args.output, args.stdout);
  } else if (!fs.existsSync(args.template)) {
    var superTemplate = getGlobContents(args.template);
    var input = fs.readFileSync(args.input).toString();
    var result = transform(superTemplate, input);
    processTransformOutput(result, args.output, args.stdout);
  } else if (!fs.existsSync(args.input)) {
    var template = fs.readFileSync(args.template).toString();
    var superInput = getGlobContents(args.input);
    var result = transform(template, superInput);
    processTransformOutput(result, args.output, args.stdout);
  } else {
    transformFile(args.template, args.input, args.output, args.stdout);
  }
}
