{ ... }: {
  programs.starship = {
    enable = true;
    settings = {
      character = {
        error_symbol = "[❯](bold red)";
        success_symbol = "[❯](bold purple)";
        vicmd_symbol = "[❮](bold purple)";
      };

      right_format = "$cmd_duration";
      hostname = {
        ssh_only = true;
        format = "[$hostname](bold blue) ";
        disabled = false;
      };
      directory = {
        truncation_length = 0;
        truncate_to_repo = false;
        read_only = " ";
      };

      git_status = {
        ahead = " ⇡\${count}";
        diverged = " ⇕⇡\${ahead_count} ⇣\${behind_count}";
        behind = " ⇣\${count}";
        untracked = "[ ?\${count}](blue)";
        stashed = " *\${count}";
        modified = "[ !\${count}](yellow)";
        staged = "[ +($count)](yellow)";
        deleted = "";
        renamed = "";
        style = "purple";
        format = "[$ahead_behind$all_status]($style)";
      };
      aws.symbol = "  ";
      conda.symbol = " ";
      dart.symbol = " ";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      git_branch.symbol = " ";
      golang.symbol = " ";
      hg_branch.symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      memory_usage.symbol = " ";
      nim.symbol = " ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      package.symbol = " ";
      python.symbol = " ";
      rust.symbol = " ";
      cmake.format = "via [$symbol]($style)";
      cobol.format = "via [$symbol]($style)";
      crystal.format = "via [$symbol]($style)";
      dart.format = "via [$symbol]($style)";
      deno.format = "via [$symbol]($style)";
      elixir.format = "via [$symbol]($style)";
      elm.format = "via [$symbol]($style)";
      erlang.format = "via [$symbol]($style)";
      golang.format = "via [$symbol]($style)";
      helm.format = "via [$symbol]($style)";
      julia.format = "via [$symbol]($style)";
      kotlin.format = "via [$symbol]($style)";
      lua.format = "via [$symbol]($style)";
      nim.format = "via [$symbol]($style)";
      nodejs.format = "via [$symbol]($style)";
      ocaml.format = "via [$symbol(($switch_indicator$switch_name) )]($style)";
      perl.format = "via [$symbol]($style)";
      php.format = "via [$symbol]($style)";
      pulumi.format = "via [$symbol$stack]($style)";
      purescript.format = "via [$symbol]($style)";
      python.format = "via [$symbol]($style)";
      red.format = "via [$symbol]($style)";
      rlang.format = "via [$symbol]($style)";
      ruby.format = "via [$symbol]($style)";
      rust.format = "via [$symbol]($style)";
      swift.format = "via [$symbol]($style)";
      vagrant.format = "via [$symbol]($style)";
      vlang.format = "via [$symbol]($style)";
      zig.format = "via [$symbol]($style)";
    };
  };
}
