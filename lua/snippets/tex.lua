local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(";a", { t("\\alpha") }),
  s(";b", { t("\\beta") }),
  s(";g", { t("\\gamma") }),
  s(";d", { t("\\delta") }),
  s(";D", { t("\\Delta") }),
  s(";p", { t("\\psi") }),
  s(";P", { t("\\Psi") }),
  s(";s", { t("\\sigma") }),
  s(";l", { t("\\lambda") }),
  s(";m", { t("\\mu") }),
  s(";n", { t("\\nu") }),
  s(";e", { t("\\epsilon") }),
  s(";th", { t("\\theta") }),
  s(";pi", { t("\\pi") }),
  s(";inf", { t("\\infty") }),
  s("needcite", { t("\\textbf{[CITE]}") }),
  s("mm", fmt("$<>$", { i(0) }, { delimiters = "<>" })),
  s("labeq", fmt("Eq. (\\label{eq:<>})", { i(0) }, { delimiters = "<>" })),
  s("refeq", fmt("Eq. (\\ref{eq:<>})", { i(0) }, { delimiters = "<>" })),
  s(";tm", fmt("\\mathrm{<>}", { i(1) }, { delimiters = "<>" })),
  s("ff", fmt("\\frac{<>}{<>}", { i(1), i(2) }, { delimiters = "<>" })),
  s("sqrt", fmt("\\sqrt{<>}", { i(1) }, { delimiters = "<>" })),
  s(";uu", fmt("^{<>}", { i(1) }, { delimiters = "<>" })),
  s(";ss", fmt("_{<>}", { i(1) }, { delimiters = "<>" })),
  s(";vb", fmt("\\vb{<>}", { i(1) }, { delimiters = "<>" })),
  s(";mc", fmt("\\mathcal{<>}", { i(1) }, { delimiters = "<>" })),
  s(";mb", fmt("\\mathbb{<>}", { i(1) }, { delimiters = "<>" })),
  s("int", fmt("\\int \\textrm{d}<> <>", { i(1), i(0) }, { delimiters = "<>" })),
  s("sum", fmt("\\sum_{<>}^{<>} <>", { i(1), i(2), i(0) }, { delimiters = "<>" })),
  s(
    "env",
    fmt(
      [[
			\begin{<>}
				<>
			\end{<>}
		]],
      { i(1), i(0), rep(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "align",
    fmt(
      [[
			\begin{align}
				<>
			\end{align}
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
