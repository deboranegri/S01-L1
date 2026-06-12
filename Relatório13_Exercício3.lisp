(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca-magica)
  (cond
    ((> forca-magica 80) (* forca-magica 1.5))
    (t forca-magica)))

(defun descricao-venda (item)
  (format nil "Item: ~a | Preco c/ imposto: R$~,2f | Forca magica c/ bonus: ~,1f"
          (item-nome item)
          (adiciona-imposto (item-preco item))
          (bonus-maldicao (item-forca-magica item))))

(defun processa-venda (catalogo)
  (let* ((so-armas (remove-if-not #'(lambda (i)
                                      (eq (item-tipo i) 'ARMA))
                                  catalogo))
         (com-imposto (mapcar #'(lambda (i)
                                  (make-item
                                    :nome (item-nome i)
                                    :tipo (item-tipo i)
                                    :preco (adiciona-imposto (item-preco i))
                                    :forca-magica (item-forca-magica i)))
                              so-armas))
         (com-bonus (mapcar #'(lambda (i)
                                (make-item
                                  :nome (item-nome i)
                                  :tipo (item-tipo i)
                                  :preco (item-preco i)
                                  :forca-magica (bonus-maldicao (item-forca-magica i))))
                            com-imposto)))
    (mapcar #'(lambda (i)
                (format nil "Item: ~a | Preco c/ imposto: R$~,2f | Forca magica c/ bonus: ~,1f"
                        (item-nome i)
                        (item-preco i)
                        (item-forca-magica i)))
            com-bonus)))

(defun main ()
  (let ((catalogo
          (list
            (make-item :nome "Espada Demoníaca" :tipo 'ARMA     :preco 500.0  :forca-magica 90.0)
            (make-item :nome "Pocao de Cura"    :tipo 'POCAO    :preco 50.0   :forca-magica 30.0)
            (make-item :nome "Lança Sagrada"    :tipo 'ARMA     :preco 350.0  :forca-magica 75.0)
            (make-item :nome "Amuleto Antigo"   :tipo 'ARTEFATO :preco 200.0  :forca-magica 60.0)
            (make-item :nome "Cutelo Amaldiçoado" :tipo 'ARMA   :preco 420.0  :forca-magica 85.0))))

    (format t "=== Loja Clandestina de Iwai ===~%~%")
    (format t "--- Processando Vendas de Armas ---~%")
    (dolist (linha (processa-venda catalogo))
      (format t "  ~a~%" linha))))

(main)
