# nvim-config - 0.12-nightly


### For my reference
- always use node latest version (ts/js lsp won't work in older node version's)
- Use [patched fonts](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip) to fix random character for language icon place holder
- csharp_roslyn working with this version of [roslyn](https://dev.azure.com/azure-public/vside/_artifacts/feed/vs-impl/NuGet/Microsoft.CodeAnalysis.LanguageServer.linux-x64/overview/5.1.0-1.25502.8)



### TODO
- Add c# DAP support (Both unity and normal console application)
  - (Fucking visual studio takes 2GB of RAM where as nvim can do the same job in 200MB of RAM(This is in the worst case scenario))
- Need to refactor current config as per work related requirement (So that one config can be used for both the work and personal coding setup instead of multiple configs)
- Remove all the old config (lazy plugin, lsp's)
- Dap is not configured here for now with new vim.pack


### Note to setup roslyn
- Better add dll folder to $PATH and let plugin take care of the remaining stuff
