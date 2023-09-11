if exists("g:loaded_sayhello")
    finish
endif
let g:loaded_exampleplugin = 1
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/example-plugin/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/sayhello.lua'"
command! -nargs=0 SayHello lua require("sayhello").execute()
