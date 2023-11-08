# Video-Surveillance-via-Robust-PCA


The code performs matrix factorization on video data, separating it into low-rank (L) and sparse (S) components using
an iterative algorithm. It updates L and S matrices by minimizing the difference between the input video data (X) and
their sum, incorporating a regularization parameter (lambda) and adjusting a Lagrange multiplier (ro).


The code tracks the convergence of the factorization process, displaying residual error values in a log-log plot to assess
the quality of the factorization over iterations.
