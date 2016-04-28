if not modules then modules = { } end modules ['p-dabeer-num'] = {
    version   = 0.1,
    comment   = "companion to p-dabeer.tex",
    author    = "Mohammad Hossein Bateni",
    copyright = "Mohammad Hossein Bateni",
    license   = "GNU General Public License v2"
}

--[[ldx--
<p>This module implements a bunch of number conversions for Persian
typesetting.</p>
--ldx]]--

local implement = interfaces.implement

local persian_letters = {
  "آ", "ب", "پ", "ت", "ث", "ج", "چ", "ح", "خ", "د", "ذ", "ر", "ز", "ژ",
  "س", "ش", "ص", "ض", "ط", "ظ", "ع", "غ", "ف", "ق", "ک", "گ", "ل", "م",
  "ن", "و", "ه", "ی"
}

local persian_alternate_letters = {
  [1]  = "الف",
  [31] = "ه‍"
}

local abjad_letters = {
  "الف", "ب", "ج", "د", "ه‍", "و", "ز", "ح", "ط", "ی", "ک", "ل", "م", "ن",
  "س", "ع", "ف", "ص", "ق", "ر", "ش", "ت", "ث", "خ", "ذ", "ض", "ظ", "غ"
}

--[[ldx--
<p>The following function is used for <q>dabeerpersiannumerals</q>
and <q>dabeeralternatepersiannumerals</q>.  Not only do these provide
the right ordering of Persian letters, but they also fix the issue with
Persian vs. Arabic letters.  The most important feature, though, is
probably the option to use <strong>الف</strong> instead of <string>ا</strong>
and <strong>ه‍</strong> instead of <strong>ه</strong>.</p>  

<p>This is enabled by setting the argument <q>alt</q> to
<q>alternate</q>.  The other valid value is <q>normal</q>.</p>

<p>Unlike the original conversions provided by <l n='context'/>, we do not
support multi-letter conversions.  In my humble opinion, they make no sense!</p>
--ldx]]--
local function to_persian_letters(n,alt)
  if (n < 1 or n > 32) then
    print('Error[dabeer]: no Persian letter for', n)
    return "?"
  elseif alt ~= "normal" and alt ~= "alternate" then
    print('Error[dabeer]: bad alt param in to_persian_letters', alt)
    return "?"  -- maybe should be a warning only
  else
    return (alt == "alternate" and persian_alternate_letters[n]) or persian_letters[n]
  end
end

--[[ldx-- 
<p>The following function fixes a couple of issues with the
original abjad conversion in <l n='context'/>:
<ul>
   <li><q>الف</q> is used in place of <q>ا</q>.</li>
   <li>Farsi <q>ی</q> is used instead of the Arabic one.</li>
   <li>The range is restricted to 1-28.</li>
</ul>
--ldx]]-- 
local function to_abjad_letters(n)
   if (n < 1 or n > 28) then
      print('Error[dabeer]: no Abjad letter for', n) 
      return "?"  
   else 
      return abjad_letters[n] 
   end 
end

-- To test:
-- print(to_persian_letters(1,"normal"))
-- print(to_persian_letters(2,"normal"))
-- print(to_persian_letters(1,"alternate"))
-- print(to_persian_letters(2,"alternate"))

implement {
  name      = "dabeer_persian_numerals",
  actions   = { to_persian_letters, context },
  arguments = { "integer", "string" }
}

implement {
  name      = "dabeer_abjad_numerals",
  actions   = { to_abjad_letters, context },
  arguments = { "integer" }
}
