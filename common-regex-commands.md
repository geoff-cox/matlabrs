# Common regex Commands
---
## Replacements

|	Find -> Replace |	RegEx Find		|	RegEx Replace	|
|	--------------- |	----------		| 	-------------	|
|	`**stuff**`     |	`\*\*(.*?)\*\*`	|	`<em>$1</em>`	|
|	`“stuff”`       |	`“(.*?)”`		|	`<q>$1</q>`		|

---
## Removal

| Content to Remove | RegEx Find                                       | RegEx Replace                        |
| ----------------- | ----------                                       | -------------                        |
| `<image>`         | `^([ \t]*)<image([\s\S]*?)>([\s\S]*?)</image>\n` | `$1<$2> temporarily omitted </$2>\n` |


Common Reg Ex Replacements
----------------------------------------------------------------------------
`<tag>` that needs inline `<subtag>` tags

 - $1: space before tag
 - $2: tag name
 - $3: a space or end delimiter (>)
 - $4: tag attributes
 - $5: tag content

| RegEx Find                                              | RegEx Replace                        |
| ----------                                              | -------------                        |
| `^([ \s]*)<(tag)(?=[\s>])([\s\S]*?)>([\s\S]*?)</tag>\n` | `$1<$2$3><subtag>$4</subtag></$2>\n` |

----------------------------------------------------------------------------
Tags that need multiline `<p>` tags
 - $1: space before tag
 - $2: tag name
 - $3: tag attributes
 - $4: tag content

| RegEx Find                                     | RegEx Replace                                      |
| ----------                                     | -------------                                      |
| `^([ \s]*)<(tag)([\s\S]*?)>([\s\S]*?)</tag>\n` | `$1<$2$3>\n$1\t<p>\n$1\t\t$4\n$1\t</p>\n$1</$2>\n` |

----------------------------------------------------------------------------
Single to Multiline Paragraphs

| RegEx Find          | RegEx Replace           |
| ----------          | -------------           |
| `(\t+)<p>(.*)</p>?` | `$1<p>\n$1\t$2\n$1</p>` |
----------------------------------------------------------------------------
Converting <foo> tags to single line

| RegEx Find                       | RegEx Replace     |
| ----------                       | -------------     |
| `^(\s+)<foo>\n\s+(.*)\n.*</foo>` | `$1<foo>$2</foo>` |
----------------------------------------------------------------------------
Removing the content from foo tags
Add additional tags with `(foo|bar)`

| RegEx Find                                       | RegEx Replace            |
| ----------                                       | -------------            |
| `^([ \t]*)<(foo)([\s\S]*?)>([\s\S]*?)</(foo)>\n` | `$1<$2> omitted </$2>\n` |
----------------------------------------------------------------------------
Removing paragraphs from <foo> tags

| RegEx Find                                                      | RegEx Replace       |
| ----------                                                      | -------------       |
| `^([ \t]*)<foo>\n\s*<p>\n*\s*([\s\S]*?)\n*\s*</p>\n\s*</foo>\n` | `$1<foo>$2</foo>\n` |
----------------------------------------------------------------------------
Remove comments <!-- * -->
Task                          | RegEx Find            | RegEx Replace   |
----                          | ----------            | -------------   |
Remove comments               | `<!--([\s\S]*?)-->\n` | `$1`            |
`**foo**` ➜ `<bar>foo</bar>` | `\*\*(.*?)\*\*`       | `<bar>$1</bar>` |
----------------------------------------------------------------------------
Swap premises and responses

| RegEx Find                                                                   | RegEx Replace                                        |
| ----------                                                                   | -------------                                        |
| `^([ \t]*)<premise>([\s\S]*?)</premise>\n\s*<response>([\s\S]*?)</response>` | `$1<premise>$3</premise>\n$1<response>$2</response>` |

----------------------------------------------------------------------------
Comment all imported files

| RegEx Find                                                                   | RegEx Replace                                        |
| ----------                                                                   | -------------                                        |
| `^([ \t]*)<premise>([\s\S]*?)</premise>\n\s*<response>([\s\S]*?)</response>` | `$1<premise>$3</premise>\n$1<response>$2</response>` |

Adding Comments

| RegEx Find                    | RegEx Replace                       |
| ----------                    | -------------                       |
| `<xi:include href="(.*?)" />` | `<!-- <xi:include href="$1" /> -->` |