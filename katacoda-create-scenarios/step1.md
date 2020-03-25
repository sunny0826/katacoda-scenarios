A Katacoda scenario is a series of Markdown files, bash scripts and a JSON file to define how your scenario should be configured, the text for the scenario and any automation required.
Katacoda scenario 是由一组 Markdown、bash 脚本和一个 JSON 文件组成

## 任务

点击命令拉取实例存储库：

`git clone https://github.com/sunny0826/katacoda-create-scenario.git katacoda-create-scenario`{{execute}}

在该存储库中，您将得到一组 Katacoda 的示例。

当前运行的方案位于该存储库中 `ls -l`{{execute}}。目录的名称为创建方案时定义的 URL。

当前步骤示例为 `katacoda-create-scenario/step1.md`{{open}}

所有步骤都是通过 JSON 文件描述的 `katacoda-create-scenario/index.json`{{open}}

JSON 文件中定义了方案标题、描述、步骤顺序、UI 布局以及所需环境。您可以在 [katacoda.com/docs/scenarios/layouts](https://katacoda.com/docs/scenarios/layouts) 中找到更多有关布局的信息，有关所需环境的信息，请访问 [katacoda.com/docs/scenarios/environments](https://katacoda.com/docs/scenarios/environments)。
