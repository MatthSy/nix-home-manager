{...}: {
  programs.wofi = {
    enable = true;
    settings = {
      yoffset = 200;
      prompt = "Execute";
      allow_images = true;
      hide_scroll = true;
      columns = 1;
      height = "20%";
      width = "20%";
      key_expand = "Tab";
    };
  };
}
