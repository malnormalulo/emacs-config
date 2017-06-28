(defun bsp-xml-to-cfg '()
  (display-message-or-buffer (regexp-quote "<cm:property\\s+name=\"(.*?)\"\\s+value=\"(.*?)\"\\s*/>")))
