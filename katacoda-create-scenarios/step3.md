为了更方便的创建 index.json 和方案结构，Katacoda 开发了命令行交互工具（CLI）。

## 安装 CLI

通过 `npm` 命令安装 `npm i katacoda-cli --global`{{execute}}.

命令遵循语法的是 `$ katacoda COMMAND`

安装完成后，可以通过运行命令 `katacoda --help`{{execute}} 查看帮助信息。

## 创建方案

例如，要创建新的方案，可以通过运行命令 `katacoda scenarios:create`{{execute}}，CLI 将会提示一些信息，帮助您创建方案：
- **Friendly URL:** 此处可输入 `test-scenario`，该属性将确定方案文件夹的名称，以及用来访问他的 URL。因此，该属性不能包括空格，需要是小写字母等。例如，如果您的用户名是 test-username 并且您的方案称为 test-scenario（如建议的那样），用于在平台中指向该方案的URL将为 https://katacoda.com/test-username/scenarios/test-scenario/
- **Title:** 方案的标题
- **Description:** 方案的描述，将会显示在简介上
- **Difficulty level:** 难度级别，将会显示在简介上
- **Estimated time:** 估计完成的时间，将会显示在简介上
- **Number of steps:** 方案的步骤数。CLI 将会为您的所有步骤创建文件
- **Image:** 确定适用于您的方案的基本软件。例如，如果您需要 docker，java，go 等作为前提条件。更多相关信息，请阅读 [katacoda.com/docs/scenarios/environments](https://katacoda.com/docs/scenarios/environments)
- **Layout:** 它将确定方案界面元素的配置。例如，如果您只想显示终端，或编辑器+终端等形式，更多相关信息，请阅读[katacoda.com/docs/scenarios/layouts](https://katacoda.com/docs/scenarios/layouts)

输入这些信息，CLI 将帮您创建一个文件夹，其中引入了 ***friendly URL*** 的名称，并将在该文件夹内创建方案所需的文件。

您可以通过如下命令检查您创建的方案：`ls test-scenario*`{{execute}}
