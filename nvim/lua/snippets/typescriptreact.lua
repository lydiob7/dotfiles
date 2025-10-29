local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  s(
    'rafce',
    fmt(
      [[
import type {{ ComponentProps, FC }} from 'react';
import {{ cn }} from 'utils/cn'

interface {}Props extends ComponentProps<'div'> {{
}}

const {}: FC<{}Props> = ({{ className }}) => {{
  return (
    <div className={{cn('', className)}}>{}</div>
  );
}}

export default {}
  ]],
      {
        f(function()
          return vim.fn.expand '%:t:r'
        end),
        f(function()
          return vim.fn.expand '%:t:r'
        end),
        f(function()
          return vim.fn.expand '%:t:r'
        end),
        i(1), -- content
        f(function()
          return vim.fn.expand '%:t:r'
        end),
      }
    )
  ),
}
