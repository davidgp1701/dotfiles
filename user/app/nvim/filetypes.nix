{
  autoGroups = {
    filetypes = {};
  };

  files."ftdetect/terraformft.lua".autoCmd = [
    {
      group = "filetypes";
      event = ["BufRead" "BufNewFile"];
      pattern = ["*.tf" " *.tfvars"];
      command = "set ft=terraform";
    }
  ];

  files."ftdetect/hcl.lua".autoCmd = [
    {
      group = "filetypes";
      event = ["BufRead" "BufNewFile"];
      pattern = ["*.hcl"];
      command = "set ft=hcl";
    }
  ];

  files."ftdetect/helm.lua".autoCmd = [
    {
      group = "filetypes";
      event = ["BufRead" "BufNewFile"];
      pattern = [
        "*/templates/*.yaml"
        "*/templates/*.tpl"
        "*.gotmpl"
        "helmfile*.yaml"
      ];
      command = "set ft=helm";
    }
  ];
}
