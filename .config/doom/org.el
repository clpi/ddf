;;; org.el -*- lexical-binding: t; -*-
;;;
(use-package! org-ql
  :ensure t
  :bind (("C-c o q" . org-ql-search)
         ("C-c o Q" . org-ql-view))
  :after org)


(map! :leader
      :prefix "n x"
      :desc "Frame capture" "c" #'+org-capture/open-frame
      :prefix "n r"
      :desc "Refile" "R" #'org-roam-refile
      :desc "Ref add" "F" #'org-roam-ref-add
      :desc "Tag add" "t" #'org-roam-tag-add
      :desc "Open node" "o" #'org-roam-node-open
      :prefix "n j"
      :desc "Previous entry" "," #'org-journal-previous-entry
      :desc "Next entry" "." #'org-journal-next-entry)

(use-package! org-download
  :after org
  :bind (:map org-mode-map
              ("C-o C-d" . org-download-clipboard)
              ("C-o C-p" . org-download-paste)
              ("C-o C-s" . org-download-screenshot)
              ("C-o C-f" . org-download-clipboard-link))
  :init
  (add-hook 'dired-mode-hook #'org-download-enable))

(use-package! org-transclusion
  :after org
  :ensure t
  :config (map! :map global-map "C-o C-t C-a" #'org-transclusion-add :desc "Org transclusion add"
                :map global-map "C-o C-t C-k" #'org-transclusion-remove :desc "Org transclusion remove"
                :map global-map "C-o C-t C-r" #'org-tfansclusion-refresh :desc "Org tfansclusion refresh"
                :map global-map "C-o C-t C-d" #'org-transclusion-detach :desc "Org transclusion detach"
                :leader :prefix "n" :desc "Org transclusion mode" "t" #'org-transclusion-mode))

(use-package! org-ai
  :ensure t
  :commands (org-ai-mode
             org-ai-global-mode)
  :init
  (add-hook 'org-mode-hook #'org-ai-mode)
  (org-ai-global-mode)
  :config
  (setq org-ai-default-chat-model "gpt-4")
  (org-ai-install-yasnippets))

(setq
 deft-directory "~/org/deft"
 ;; copilot-idle-delay 0
 ;; copilot-enable-predicates t
 org-hide-emphasis-markers t)
