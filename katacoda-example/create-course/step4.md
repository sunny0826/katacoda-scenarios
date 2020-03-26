CLI 可将现有的 scenarios 添加到课程中。

您可以使用以下命令列出可用的方案：
`find ./ -type f | grep index.json`{{execute}}

例如，可以在运行以下命令在先前创建的课程 *test-course* 中添加称现有方案，并执行以下步骤：
`katacoda courses:add:scenarios`{{execute}}

CLI 将提示您以下问题：
- Scenario path: type `./quiz`
- Course path: type `./test-course`

然后选择是否要将 scenario 复制或移动到课程文件夹。

之后，您可以看到 scenario 已添加到 `test-course`
`katacoda-scenario-examples/test-course-pathway.json`{{open}}

<pre class="file">
{
  "title": "test-course",
  "description": "Example course",
  "courses": [
    {
      "course_id": "quiz",
      "title": "Interactive Quiz",
      "description": "Verify understand and key points by using an interactive quiz"
    }
  ]
</pre>