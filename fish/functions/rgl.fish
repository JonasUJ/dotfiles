function rgl
     if isatty stdout
        command rg -p $argv | less -RMFXKS
     else
        command rg $argv
     end
end
