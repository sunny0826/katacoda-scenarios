Katacoda 还提供了命令行工具，可帮助创建课程和 scenarios 等所需的文件。

您可以使用以下命令安装 CLI：
`npm i katacoda-cli --global`{{execute}}

这些命令遵循语法
`$ katacoda COMMAND`

如果需要帮助，请使用 `katacoda --help`{{execute}} 命令查看可用命令。

要创建一个课程（例如，*test-course*），您可以运行以下命令并遵循以下步骤：

```
cd katacoda-scenario-examples
katacoda courses:create
```{{execute}}

CLI 将会提示您如下问题：
- **Title:** 课程的标题，将会显示在简介上
- **Description:** 方案的描述，将会显示在简介上
- **Friendly-url:** 此处可输入 `test-course`，该属性将确定方案文件夹的名称，以及用来访问他的 URL。因此，该属性不能包括空格，需要是小写字母等。例如，如果您的用户名是 test-username 并且您的方案称为 test-course（如建议的那样），用于在平台中指向该方案的URL将为 https://katacoda.com/test-username/scenarios/test-scenario/

之后您可以通过如下命令检查您创建的方案：`ls test-course*`{{execute}}

`katacoda-scenario-examples/test-course-pathway.json`{{open}}
中您可以看到空的课程定义

<pre class="file">
{
  "title": "test-course",
  "description": "Example course",
  "courses": []
}
</pre>
