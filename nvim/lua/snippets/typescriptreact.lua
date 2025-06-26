local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

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
        i(1, 'NewComponent'), -- name
        rep(1), -- name again
        rep(1), -- name again
        rep(1), -- content
        rep(1), -- export
      }
    )
  ),
}
