;; -*- Mode: Emacs-Lisp -*-
;;
;; alist.el
;;
;; Author:   Naoto Morishima <naoto-m@is.aist-nara.ac.jp>
;;              Nara Institute of Science and Technology, Japan
;; Created:  22 December, 1996
;; Version:  0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

(provide 'alist)

;
; code
;
(defun asput (alist-symbol key &optional value)
  (asdelete alist-symbol key)
  (set alist-symbol (nconc (list (cons key value))
			   (eval alist-symbol))))

(defun asget (alist key)
  (cdr (assoc key alist)))

(defun asdelete (alist-symbol key)
  (let* ((alist (eval alist-symbol))
	 (element (assoc key alist)))
    (if element
	(set alist-symbol (delete element alist))
      alist)))