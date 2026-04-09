local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("cc", fmt("`<>`", { i(0) }, { delimiters = "<>" })),
  s(
    "env",
    fmt(
      [[
			```
			<>
			```
		]],
      { i(0) },
      { delimiters = "<>" }
    )
  ),
  s("needfig", {
    t({ "\\vspace{1em} INCLUDE FIGURE OF" }),
    i(0),
    t({ "\\vspace{1em}" }),
  }),
}
