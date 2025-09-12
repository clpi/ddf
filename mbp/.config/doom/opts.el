;;; opts.el -*- lexical-binding: t; -*-


(use-package emacs
  :custom
  (context-menu-mode t)
  (completion-cycle-threshold 3)
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt))
  (enable-recursive-minibuffers t))


(setq
 confirm-kill-emacs nil
 confirm-kill-processes nil
 tooltip-short-delay 0
 which-key-idle-delay 0.01
 tooltip-delay 0
 eldoc-idle-delay 0
 display-line-numbers-type 'relative
 doom-localleader-key ","
 org-directory "~/org/"
 org-roam-directory "~/org/roam"
 org-default-notes-file "~/org/notes.org"
 org-journal-dir "~/org/journal/"
 +org-roam-open-buffer-on-find-file t
 org-attach-id-dir "~/org/assets/"
 doom-modeline-enable-word-count 1
 user-full-name "Chris Pecunies"
 user-mail-address "chris@pecunies.com"
 doom-themes-enable-bold 1
 doom-themes-enable-italic 1
 doom-themes-padded-modeline 1
 doom-big-font (font-spec :family "ZedMono Nerd Font" :size 14 :weight 'normal)
 doom-serif-font (font-spec :family "ZedMono Nerd Font" :size 10 :weight 'normal)
 doom-font (font-spec :family "ZedMono Nerd Font" :size 10 :weight 'normal)
 doom-emoji-font (font-spec :family "ZedMono Nerd Font" :size 10 :weight 'normal)
 doom-symbol-font (font-spec :family "ZedMono Nerd Font" :size 10 :weight 'normal)
 doom-variable-pitch-font (font-spec :family "ZedMono Nerd Font" :size 13 :weight 'normal)
 doom-theme 'doom-palenight
 ;; doom-themes-treemacs-enable-variable-pitch t
 kill-whole-line t)


(cond (IS-MAC
       (setq mac-command-modifier 'meta
             mac-option-modifier 'super
             mac-right-option-modifier 'hyper
             mac-right-command-modifier 'hyper)
       (setenv "PATH" (concat "/opt/homebrew/bin:" (getenv "PATH")))
       (setq exec-path (append exec-path '("/opt/homebrew/bin")))))

(when IS-MAC
  (use-package! org-mac-link
    :after org
    :config
    (setq
     org-mac-grab-Acrobat-app-p nil ; Disable grabbing from Adobe Acrobat
     org-mac-grab-devonthink-app-p nil) ; Disable grabbinb from DevonThink
    (map! :map org-mode-map
          "C-c C-g" #'org-mac-link-safari-get-frontmost-url
          "C-o C-m" #'org-mac-link-mail-insert-selected
          "C-o C-p" #'org-mac-link-skim-get-page
          "C-c g"  #'org-mac-grab-link)))

(setopt ivy-use-selectable-prompt t)
;; OPTIONAL configuration


;; (use-package! doom-modeline
;;   :config
;;   )
