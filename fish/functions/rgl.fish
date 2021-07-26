function rgl
     if isatty stdout
        command rg -p $argv | less -RMFXK
     else
        command rg $argv
     end
end
