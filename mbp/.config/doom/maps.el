(map! :localleader
      "e" #'+treemacs/toggle :desc "Toggle treemacs"
      "t" #'+eshell/toggle :desc "Toggle eshell"
      "o" #'+vterm/toggle :desc "Toggle vterm"
      "." #'+shell/toggle :desc "Toggle shell"
      "," #'+default/org-notes-search :desc "Search org notes"
      :leader
      "e" #'+treemacs/toggle :desc "Toggle treemacs"
      "v" #'+vterm/toggle :desc "Toggle vterm"
      )
(map!

 :n "SPC f o" 'consult-recent-file
 :n "SPC f r" 'consult-recent-file
 :n "SPC f g" 'consult-grep

 :n ";" 'evil-ex
 :n ":" 'counsel-M-x
 :n "C-;" 'counsel-M-x
 :n ",ff" 'find-file
 :n ",fd" 'consult-fd
 :n ",sn" '+snippets/new
 :n ",m" 'consult-mode-command
 :n ",N" '+default/org-notes-search
 :n ",o" 'consult-history
 :n ",h" 'consult-help
 :n ",jj" 'org-journal-new-entry
 :n ",j." 'org-journal-next-entry
 :n ",j," 'org-journal-previous-entry
 :n ",p" '+ivy/projectile-find-file


                                        ; ORG ROAM
 :n "-=" '+org-add-note
 :n "--" 'org-roam-today
 :n "-i" 'org-roam-jump-to-index
 :n "-C" 'org-roam-capture
 :n "-t" 'org-roam-tomorrow
 :n "-y" 'org-roam-yesterday
 :n "-d" 'org-roam-dailies-find-date
 :n "-T" 'org-roam-dailies-capture-tomorrow
 :n "-Y" 'org-roam-dailies-capture-yesterday
 :n "-_" 'org-roam-dailies-capture-today
 :n "-c" 'counsel-org-capture

 :n ",s" 'consult-separator
 :n ",r" 'consult-lsp-file-symbols
 :n ",lp" 'package-show-packag-list
 :n ",lw" '+pass/ivy
 :n ",R" 'consult-recent-file
 :n ",g" 'consult-grep
 :n ",T" 'consult-theme
 :n ",i" 'consult-imenu
 :n ",d" 'consult-lsp-diagnostics

 :n ",t" 'tab-new
 :n ",w" 'tab-close
 :n ",<" 'tab-next
 :n ",>" 'tab-previous

 :n ",cc" 'copilot-chat
 :n ",s" 'consult-lsp-symbols
 :n ",S" 'consult-lsp-file-symbols
 :n "L" 'next-buffer ; 'evil-ex-command bnext
 :n "H" 'previous-buffer ; 'evil-ex-command bprev
 :n "<C-h>" 'evil-window-left
 :n "<C-l>" 'evil-window-right
 :n "<C-k>" 'evil-window-up
 :n "<C-j>" 'evil-window-down
 :n ",r" 'counsel-rg
 :n ",b" 'counsel-switch-buffer
 :n ",l" 'counsel-find-library

 :n ",p" 'counsel-projectile
 :n ",z" 'counsel-fzf
 :n ",y" 'counsel-yank-pop
 :n ",C" 'counsel-org-capture
 :n ",A" 'consult-org-agenda
 )

(map!
 "C-x b"   #'counsel-buffer-or-recentf
 "C-x o"   #'ouunsel-outline
 "C-x b"   #'counsel-switch-buffer
 "C-x C-o" #'ouunsel-outline
 "C-x C-b" #'counsel-switch-buffer
 "C-x C-;" #'counsel-M-x
 "C-x ;"   #'counsel-M-x-action

 "C-x C-x" #'+vterm/toggle
 "C-x C-t" #'+term/toggle
 "C-x C-s" #'+shell/toggle
 "C-x C-e" #'+eshell/toggle

 "C-x x" #'+treemacs/toggle
 "C-c c" #'+vterm/toggle


 "C-c C-t" #'tab-new
 "C-c C-w" #'tab-close
 "C-c C-o" #'tab-close-other
 "C-c ," #'tab-previous
 "C-c ." #'tab-next

 "C-o C-t" #'org-todo
 "C-o t"   #'org-todo-list
 "C-o T"   #'org-show-todo-tree
 "C-o ENTER" #'org-insert-todo-heading
 "C-o C-t" #'org-timestamp
 "C-o t"   #'org-timestamp-inactive

 "C-o C-l" #'counsel-org-link
 "C-o C-f" #'counsel-org-file
 "C-o C-i" #'counsel-org-insert-link
 "C-o C-c" #'counsel-org-capture
 )
