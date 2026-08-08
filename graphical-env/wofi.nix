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
      term = "kitty";
    };

    style = ''
      #window {
        background: transparent;
      }

      #outer-box {
        background: solid;
        /* color: --wofi-color7; */

        border: 3px solid /* --wofi-color1; */
        border-radius: 10px;
      }

      #input {
        border: 0;
        border-radius: 6px 6px 0 0;
        background: solid /* --wofi-color8; */
      }

      #entry:selected {
        /* background: --wofi-color1;
        color: --wofi-color7; */
        box-shadow: 0px 0px 10px 3px /* --wofi-color1;*/
      }

    '';
  };
}
