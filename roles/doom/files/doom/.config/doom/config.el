;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq auto-save-default t make-backup-files t)

(beacon-mode t)

(setq bookmark-default-file "~/.config/doom/bookmarks")

(map! :leader
      (:prefix ("b". "buffer")
       :desc "List bookmarks"                          "L" #'list-bookmarks
       :desc "Set bookmark"                            "m" #'bookmark-set
       :desc "Delete bookmark"                         "M" #'bookmark-set
       :desc "Save current bookmarks to bookmark file" "w" #'bookmark-save))

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

(defun exclude-centaur-tabs-from-buffer (buffer)
  "Returns non-nil if BUFFER should be excluded from Centaur Tabs."
  (or (string-prefix-p "*" (buffer-name buffer))
      (string= (buffer-name buffer) "*doom*")
      (string= (buffer-name buffer) "*scratch*")
      (string= (buffer-name buffer) "*Messages*")
      (string-prefix-p "*Treemacs-scoped-Buffer-Perspective" (buffer-name buffer))))

(defun hide-centaur-tabs-in-buffer  (buffer)
  "Returns non-nil if BUFFER should be excluded from Centaur Tabs."
  (or (string-prefix-p "*" (buffer-name buffer))
      (string= (buffer-name buffer) "*doom*")
      (string= (buffer-name buffer) "*scratch*")
      (string= (buffer-name buffer) "*Messages*")
      (with-current-buffer buffer
        (derived-mode-p 'treemacs-mode))))

(setq centaur-tabs-set-bar 'over
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-modified-marker "•"
      centaur-tabs-hide-tab-function #'exclude-centaur-tabs-from-buffer
      centaur-tabs-hide-tab-function #'hide-centaur-tabs-in-buffer)

(map! :leader
      :desc "Toggle tabs globally" "t TAB" #'centaur-tabs-mode
      :desc "Toggle tabs local display" "t <backtab>" #'centaur-tabs-local-mode)

(evil-define-key 'normal centaur-tabs-mode-map (kbd "g <right>") 'centaur-tabs-forward        ; default Doom binding is 'g t'
                                               (kbd "g <left>")  'centaur-tabs-backward       ; default Doom binding is 'g T'
                                               (kbd "g <down>")  'centaur-tabs-forward-group
                                               (kbd "g <up>")    'centaur-tabs-backward-group)

(setq fancy-splash-image (concat doom-private-dir "splash/hlb-splash.png"))

(defun dashboard-ascii ()
  (let* ((banner '("                                                                     .                "
                   "         .:  :                                                      :.               ."
                   "..-:.   ..  .::..                                                ..=......:    .-::.. "
                   "   ..::--::::-::===-====--.                             .:=---===+=-:--=-::::-:.      "
                   "   :.     .:-. ....: :**+.                               .=++. : ..    ..:.           "
                   "       .    .    .-:=-*++     -*+=.             .*++:    .*++::-..  ..                "
                   "   . .:-:. .=  ... :. ===     .++:    .=+++-.    =+=.     +==-=:::::....              "
                   "          ..:.::.=...:+==     :+=:      ++=      ===.     === +...       ..  .        "
                   "               -:..=+.===     :+=-      +==      ==+.    .+==  .-. :.........:        "
                   "       .:..::.::  ::: ==+     :=+:      ++=      -==.     +==-:-  =:.                 "
                   "     ..   .    ..:..  ==+     :++-      +=-      -==.    .+=+..-=- ...:=::.           "
                   "             :.....:= ==+     :+=-      +==      ===.    .+=+   -::-.  ..             "
                   "         ......=-.:-::===     :==-      ++=      =++.    .+++:=+-.....                "
                   "             ..   :   +++     :++-      ++=      =+*.     +==   ::-.....              "
                   "                 .:   *++     :**-    .=***:     =+*.     ***=-+:::..                 "
                   "           :::... =:=-+**     :*+        .  .    .+*.    .**=- .=.                    "
                   "               .::::. -*#     :+                   *     .##:.  -::                   "
                   "             .:.  .=::+*#     ..                   :     -##=   . ...                 "
                   "                 .:.  -*#:                               =#= -.-.                     "
                   "                     -  #=                               **: .                        "
                   "                        :*                              .* .-.                        "
                   "                       .::=                             =::   .                       "
                   "                        .--:                           .-.                            "
                   "                           -                          .- .                            "
                   "                            --.                     .:..                              "
                   "                              ..                   ..                                 "))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'dashboard-ascii)

(add-to-list '+doom-dashboard-menu-sections
             '("Open RSS feed"
               :icon (nerd-icons-faicon "nf-fa-rss" :face 'doom-dashboard-menu-title)
               :when (featurep! :app rss +org)
               :face (:inherit (doom-dashboard-menu-title bold))
               :action elfeed))

(setq doom-theme 'doom-dracula
      xterm-color-preserve-properties t)

(setq-hook! 'prog-mode-hook +format-with nil)
(setq +format-on-save-enabled-modes nil)

(setq-default indent-tabs-mode nil
              tab-width 8)
(setq indent-line-function 'insert-tab)

(setq scroll-margin 8)

(require 'elfeed-goodies)
(elfeed-goodies/setup)
(setq elfeed-goodies/entry-pane-size 0.5)

(add-hook 'elfeed-search-mode-hook #'elfeed-update)

(evil-define-key 'normal elfeed-show-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)
(evil-define-key 'normal elfeed-search-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)

(map! :leader :desc "elfeed" "o n" #'elfeed)

;(setq doom-font (font-spec :family "JetBrains Mono" :size 9.0 :weight 'normal :slant 'normal :height 1.0)
;      doom-variable-pitch-font (font-spec :family "Ubuntu" :height 1.3)
;      doom-big-font (font-spec :family "JetBrains Mono" :size 24.0)
;      doom-unicode-font (font-spec :family "FiraCode Nerd Font Mono" :size 11))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(map!
 :n "C-=" #'doom/reset-font-size
 :n "C-+" #'text-scale-increase
 :n "C--" #'text-scale-decrease)

(setq user-full-name "Jonas Schwind"
      user-mail-address "jonasschwind20021@gmx.de")

(setq display-line-numbers-type 'relative)

(+global-word-wrap-mode +1)

(map! :leader
      :desc "Rename symbol" "r n" #'lsp-rename
      :desc "Execute code action" "c a" #'lsp-execute-code-action
      :desc "Search workspace symbols" "v w s" #'lsp-ivy-workspace-symbol
      :desc "Find references" "v d" #'lsp-ui-peek-find-references
      :desc "Execute code action" "v c a" #'lsp-execute-code-action
      :desc "Find references" "v r r" #'lsp-find-references
      :desc "Rename symbol" "v r n" #'lsp-rename)

(map! :map lsp-mode-map
      :desc "Show documentation" "K" #'lsp-hover
      :desc "Go to definition" "g d" #'lsp-find-definition
      :desc "Jump to next diagnostic" "[ d" #'lsp-ui-peek-jump-forward
      :desc "Jump to previous diagnostic" "] d" #'lsp-ui-peek-jump-backward)

(after! company
  (map! :map company-active-map
        :desc "Select previous candidate" "C-p" #'company-select-previous
        :desc "Select next candidate" "C-n" #'company-select-next
        :desc "Complete selection" "C-y" #'company-complete-selection
        :desc "Complete" "C-SPC" #'company-complete))

(after! lsp-java
  (setq lombok-library-path (concat doom-data-dir "lombok.jar"))
  (unless (file-exists-p lombok-library-path)
    (url-copy-file "https://projectlombok.org/downloads/lombok.jar" lombok-library-path))
  (setq lsp-java-vmargs '("-XX:+UseParallelGC" "-XX:GCTimeRatio=4" "-XX:AdaptiveSizePolicyWeight=90" "-Dsun.zip.disableMemoryMapping=true" "-Xmx4G" "-Xms100m"))
  (push (concat "-javaagent:" (expand-file-name lombok-library-path)) lsp-java-vmargs))

(set-face-attribute 'mode-line nil :font "Ubuntu-10")
(setq doom-modeline-height 25     ;; sets modeline height
      doom-modeline-bar-width 5   ;; sets right bar width
      doom-modeline-persp-name t  ;; adds perspective name to modeline
      doom-modeline-persp-icon t) ;; adds folder icon next to persp name

(map! :leader :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (setq org-directory "~/Documents/org/"
        org-roam-directory "~/Documents/org/roam/"
        org-hide-emphasis-markers t
        org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-superstar-itembullet-alist '((?+ . ?➤) (?- . ?✦)) ; changes +/- symbols in item lists
        org-log-done 'time
        org-src-fontify-natively t
        org-src-tab-acts-natively t))

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.8))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.7))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.6))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.5))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.4))))
  '(org-level-6 ((t (:inherit outline-5 :height 1.3))))
  '(org-level-7 ((t (:inherit outline-5 :height 1.2))))
  '(org-level-8 ((t (:inherit outline-5 :height 1.1)))))

(after! org
  (setq org-agenda-files '("~/Documents/org/agenda.org"))
  (setq
   org-fancy-priorities-list '("🟥" "🟧" "🟨")
   org-priority-faces
   '((?A :weight bold)
     (?B :weight bold)
     (?C :weight bold))
   org-agenda-block-separator 8411)

  (setq org-agenda-custom-commands
        '(("v" "A better agenda view"
           ((tags "PRIORITY=\"A\""
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                   (org-agenda-overriding-header "High-priority unfinished tasks:")))
            (tags "PRIORITY=\"B\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Medium-priority unfinished tasks:")))
            (tags "PRIORITY=\"C\""
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                   (org-agenda-overriding-header "Low-priority unfinished tasks:")))
            (tags "customtag"
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                   (org-agenda-overriding-header "Tasks marked with customtag:")))
            (agenda "")
            (alltodo ""))))))

(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config (setq org-auto-tangle-default t))

(use-package! org-roam
  :defer t
  :config (setq org-roam-capture-templates
        '(("m" "main" plain
           "%?"
           :if-new (file+head "main/${slug}.org" "#+title: ${title}\n")
        :immediate-finish t
           :unarrowed t)
          ("r" "reference" plain
           "%?"
           :if-new (file+head "reference/${slug}.org" "#+title: ${title}\n")
           :immediate-finish t
           :unarrowed t)
          ("a" "article" plain
           "%?"
           :if-new (file+head "article/${slug}.org" "#+title: ${title}\n")
           :immediate-finish t
           :unarrowed t)))

        (cl-defmethod org-roam-node-type ((node org-roam-node))
          "Return node-type"
          (condition-case nil
              (file-name-nondirectory
               (directory-file-name
                (file-name-directory
                 (file-relative-name (org-roam-node-file node) org-roam-directory))))
          (error "")))

        (setq org-roam-node-display-template (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag))))

(map! :leader
      (:prefix ("n r" . "org-roam")
               :desc "Toggle roam-buffer"       "r" #'org-roam-buffer-toggle
               :desc "Find Node"                "f" #'org-roam-node-find
               :desc "Insert Node"              "i" #'org-roam-node-insert
               :desc "Show Graph"               "g" #'org-roam-graph
               :desc "Capture to Node"          "c" #'org-roam-capture
               :desc "Capture Dailies"          "j" #'org-roam-dailies-capture-today))

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :init (when (featurep 'xwidget-internal)
          (setq org-roam-ui-browser-function #'xwidget-webkit-browse-url))
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package rainbow-mode :hook (prog-mode . rainbow-mode ))

(setq shell-file-name "/bin/zsh"
      vterm-max-scrollback 5000)
(setq eshell-rc-script "~/.config/doom/eshell/profile"
      eshell-aliases-file "~/.config/doom/eshell/aliases"
      eshell-history-size 5000
      eshell-buffer-maximum-lines 5000
      eshell-hist-ignoredups t
      eshell-scroll-to-bottom-on-input t
      eshell-destroy-buffer-when-process-dies t
      eshell-visual-commands'("bash" "htop" "ssh" "top" "zsh"))
(map! :leader
      :desc "Eshell"                 "e s" #'eshell
      :desc "Eshell popup toggle"    "e t" #'+eshell/toggle
      :desc "Counsel eshell history" "e h" #'counsel-esh-history
      :desc "Vterm popup toggle"     "v t" #'+vterm/toggle)
