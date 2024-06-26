function rgd
     if isatty stdout
        command rg --json -p $argv | delta
     else
        command rg $argv
     end
end
