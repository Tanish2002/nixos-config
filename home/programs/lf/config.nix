{ pkgs, ... }:
let
  lf_cleaner = pkgs.writeShellScriptBin "lf_cleaner" ''
    if [ -n "$FIFO_UEBERZUG" ]; then
    	printf '{"action": "remove", "identifier": "PREVIEW"}\n' > "$FIFO_UEBERZUG"
    fi
  '';
in {
  programs.lf = {
    previewer.source = "${pkgs.scripts}/bin/lf_preview.sh";
    extraConfig = ''
      set cleaner ${lf_cleaner}/bin/lf_cleaner
    '';
    settings = {
      icons = true;
      preview = true;
      hidden = true;
    };
    keybindings = {
      "d" = null;
      "dD" = "delete";
      "dd" = "cut";
      "y" = null;
      "yy" = "copy";
      "yd" = "yank-dirname";
      "yn" = "yank-basename";
      "y." = "yank-basename-without-extension";
      "yp" = "yank-path";
      "p" = null;
      "pp" = "paste-async";
    };
    commands = {
      "paste-async" = ''
            &{{
            set -- $(cat ~/.local/share/lf/files)
            mode="$1"
            shift
            case "$mode" in
                copy)
                    rsync -av --ignore-existing --progress -- "$@" . |
                    stdbuf -i0 -o0 -e0 tr '\r' '\n' |
                    while IFS= read -r line; do
                        lf -remote "send $id echo $line"
                    done
                    ;;
                move) mv -n -- "$@" .;;
            esac
            rm ~/.local/share/lf/files
            lf -remote "send load"
            lf -remote "send clear"
        }}
      '';

      "yank-dirname" =
        ''$dirname -- "$f" | head -c-1 | xclip -i -selection clipboard'';

      "yank-path" = ''$printf '%s' "$fx" | xclip -i -selection clipboard'';

      "yank-basename" =
        ''$basename -a -- "$fx" | head -c-1 | xclip -i -selection clipboard'';

      "yank-basename-without-extension" = ''
        ''${{
            echo "$fx" |
              xargs -r -d '\n' basename -a |
              awk -e '{
                for (i=length($0); i > 0; i--) {
                  if (substr($0, i, 1) == ".") {
                    if (i == 1) print $0
                    else print substr($0, 0, i-1
                    break
                  }
                
                if (i == 0)
                  print $0
              }' |
              if [ -n "$fs" ]; then cat; else tr -d '\n'; fi |
              xclip -i -selection clipboard
        }}
      '';
      "open" = ''
        ''${{
            case $(${pkgs.file}/bin/file --mime-type "$f" -bL) in
                text/*|application/json) $EDITOR "$f";;
                application/pdf) ${pkgs.zathura}/bin/zathura "$f";;
                *) xdg-open "$f" ;;
            esac
        }}'';
    };
  };
  home.sessionVariables = {
    LF_ICONS =
      "*.nix=:di=:ln=:ex=:fi=:*.ml=λ:*.mli=λ:*.styl=:*.scss=:*.py=:*.pyc=:*.pyd=:*.pyo=:*.php=:*.markdown=:*.md=:*.json=:*.js=:*.bmp=:*.gif=:*.ico=:*.jpeg=:*.jpg=:*.png=:*.svg=:*.svgz=:*.tga=:*.tiff=:*.xmb=:*.xcf=:*.xpm=:*.xspf=:*.xwd=:*.cr2=:*.dng=:*.3fr=:*.ari=:*.arw=:*.bay=:*.crw=:*.cr3=:*.cap=:*.data=:*.dcs=:*.dcr=:*drf=:*.eip=:*.erf=:*.fff=:*.gpr=:*.iiq=:*.k25=:*.kdc=:*.mdc=:.*mef=:*.mos=:.*.mrw=:.*.obm=:*.orf=:*.pef=:*.ptx=:*.pxn=:*.r3d=:*.raf=:*.raw=:*.rwl=:*.rw2=:*.rwz=:*.sr2=:*.srf=:*.srf=:*.srw=:*.tif=:*.x3f=:*.ejs=:*.htm=:*.html=:*.slim=:*.xml=:*.mustasche=:*.css=:*.less=:*.bat=:*.conf=:*.ini=:*.rc=:*.yml=:*.cfg=:*.rc=:*.rss=:*.coffee=:*.twig=:*.c++=:*.cc=:*.c=:*.cpp=:*.cxx=:*.c=:*.h=:*.hs=:*.lhs=:*.lua=:*.jl=:*.go=:*.ts=:*.db=:*.dump=:*.sql=:*.sln=:*.suo=:*.exe=:*.diff=:*.sum=:*.md5=:*.sha512=:*.scala=:*.java=:*.jar=:*.xul=:*.clj=:*.cljc=:*.pl=:*.pm=:*.t=:*.cljs=:*.edn=:*.rb=:*.fish=:*.sh=:*.bash=:*.dart=:*.f#=:*.fs=:*.fsi=:*.fsscript=:*.fsx=:*.rlib=:*.rs=:*.d=:*.erl=:*.hrl=:*.ai=:*.psb=:*.psd=:*.jsx=:*.vim=:*.vimrc=:*.aac=:*.anx=:*.asf=:*.au=:*.axa=:*.flac=:*.m2a=:*.m4a=:*.mid=:*.midi=:*.mp3=:*.mpc=:*.oga=:*.ogg=:*.ogx=:*.ra=:*.ram=:*.rm=:*.spx=:*.wav=:*.wma=:*.ac3=:*.avi=:*.flv=:*.mkv=:*.mov=:*.mov=:*.mp4=:*.mpeg=:*.mpg=:*.webm=:*.epub=:*.pdf=:*.fb2=:*.djvu=:*.7z=:*.apk=:*.bz2=:*.cab=:*.cpio=:*.deb=:*.gem=:*.gz=:*.gzip=:*.lh=:*.lzh=:*.lzma=:*.rar=:*.rpm=:*.tar=:*.tgz=:*.xz=:*.zip=:*.cbr=:*.cbz=:*.log=:*.doc=:*.docx=:*.adoc=:*.xls=:*.xls=:*.xlsmx=:*.pptx=:*.ppt=:*.Xdefaults=:*.Xresources=:*.bashprofile=:*.bash_profile=:*.bashrc=:*.dmrc=:*.d_store=:*.fasd=:*.gitconfig=:*.gitignore=:*.jack-settings=:*.mime.types=:*.nvidia-settings-rc=:*.pam_environment=:*.profile=:*.recently-used=:*.selected_editor=:*.xinitpurc=:*.zprofile=:*.yarnc=:*.snclirc=:*.tmux.conf=:*.urlview=:*.config=:*.ini=:*.user-dirs.dirs=:*.mimeapps.list=:*.offlineimaprc=:*.msmtprc=:*.Xauthority=:*.config=sub=:srt=:idx=:*.mbsyncrc=:*lfrc=";
    LF_COLORS =
      "ln=01;36:di=01;34:.git/=02:.gitignore*=02:node_modules/=02:Makefile*=02;33:PKGBUILD*=02;33:go.mod*=02;33:go.sum*=02;33:README*=33:LICENSE.*=33:*.md=33:*.tex=01;33:*.JPG=36:*.gif=36:*.jpeg=36:*.jpg=36:*.png=36:*.webp=36:*.pdf=35:*.odt=02;35:*.odp=02;35:*.apk=34:*.bz2=34:*.gz=34:*.tar=34:*.tbz2=34:*.tgz=34:*.zip=34:*.7z=34:*.xz=34:*.zst=34:ex=01;32:*.sh=32:*.html=01;35:*.css=01;35:*.js=01;35:*.py=02;34:*.go=0:*.avi=02;36:*.m4a=02;36:*.m4v=02;36:*.mkv=02;36:*.mp3=02;36:*.mp4=02;36:*.ogg=02;36:*.opus=02;36:*.webm=02;36:";
  };
}
