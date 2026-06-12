(defstruct local
  nome
  elemento
  dificuldade
  recompensa)

(defun bonus-elemental (loc)
  (let ((elem  (local-elemento loc))
        (recomp (local-recompensa loc)))
    (cond
      ((or (eq elem 'PYRO) (eq elem 'ELECTRO)) (* recomp 1.20))
      ((eq elem 'CRYO) (* recomp 1.10))
      (t recomp))))

(defun vale-a-pena (loc)
  (and (> (bonus-elemental loc) 500)
       (<= (local-dificuldade loc) 3)))

(defun rota-de-farm (catalogo)
  (mapcar #'(lambda (loc)
              (format nil "~a - Recompensa: ~,2f"
                      (local-nome loc)
                      (bonus-elemental loc)))
          (remove-if-not #'vale-a-pena catalogo)))

(defun main ()
  (let ((catalogo
          (list
            (make-local :nome "Dominio do Fogo"     :elemento 'PYRO    :dificuldade 2 :recompensa 450.0)
            (make-local :nome "Abismo de Gelo"      :elemento 'CRYO    :dificuldade 3 :recompensa 480.0)
            (make-local :nome "Tempestade Electro"  :elemento 'ELECTRO :dificuldade 1 :recompensa 500.0)
            (make-local :nome "Vale dos Ventos"     :elemento 'ANEMO   :dificuldade 4 :recompensa 600.0)
            (make-local :nome "Lagoa Hydro"         :elemento 'HYDRO   :dificuldade 2 :recompensa 300.0))))

    (format t "=== Viajantes de Teyvat ===~%~%")

    (format t "--- Todos os Locais (com bonus elemental) ---~%")
    (dolist (loc catalogo)
      (format t "  ~a | Elemento: ~a | Dificuldade: ~a | Recompensa c/ bonus: ~,2f~%"
              (local-nome loc)
              (local-elemento loc)
              (local-dificuldade loc)
              (bonus-elemental loc)))

    (format t "~%--- Rota de Farm Recomendada ---~%")
    (dolist (linha (rota-de-farm catalogo))
      (format t "  ~a~%" linha))))

(main)
