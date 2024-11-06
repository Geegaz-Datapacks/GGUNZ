# Only in debug mode
execute unless score $ggunz.DEBUG ggunz.CONST matches 1.. run return fail

$say $(message)
#$tellraw @a [{"selector": "@s","extra": [{"text": ": "}]},{"text": "$(message)"}]
