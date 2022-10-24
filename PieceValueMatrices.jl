
const whitePawnValues = [100 100 100 100 100 100 100 100; 150 150 150 150 150 150 150 150; 110 110 120 130 130 120 110 110; 105 105 110 125 125 110 105 105; 100 100 100 120 120 100 100 100; 105 95 90 100 100 90 95 105; 105 110 110 80 80 110 110 105; 100 100 100 100 100 100 100 100]::Matrix{Int64}
const whiteKnightValues = [270 280 290 290 290 290 280 270; 280 300 320 320 320 320 300 280; 290 320 330 335 335 330 320 290; 290 325 335 340 340 335 325 290; 290 320 335 340 340 335 320 290; 290 325 330 335 335 330 325 290; 280 300 320 325 325 320 300 280; 270 280 290 290 290 290 280 270]::Matrix{Int64}
const whiteBishopValues = [310 320 320 320 320 320 320 310; 320 330 330 330 330 330 330 320; 320 330 335 340 340 335 330 320; 320 335 335 340 340 335 335 320; 320 330 340 340 340 340 330 320; 320 340 340 340 340 340 340 320; 320 335 330 330 330 330 335 320; 310 320 320 320 320 320 320 310]::Matrix{Int64}
const whiteRookValues = [500 500 500 500 500 500 500 500; 505 510 510 510 510 510 510 505; 495 500 500 500 500 500 500 495; 495 500 500 500 500 500 500 495; 495 500 500 500 500 500 500 495; 495 500 500 500 500 500 500 495; 495 500 500 500 500 500 500 495; 500 500 500 505 505 500 500 500]::Matrix{Int64}
const whiteQueenValues = [880 -890 890 895 895 890 890 880; 890 900 900 900 900 900 900 890; 890 900 905 905 905 905 900 890; 895 900 905 905 905 905 900 895; 900 900 905 905 905 905 900 895; 890 905 905 905 905 905 900 890; 890 900 905 900 900 900 900 890; 880 890 890 895 895 890 890 880]::Matrix{Int64}
const whiteKingMiddelgameValues = [-30 -40 -40 -50 -50 -40 -40 -30; -30 -40 -40 -50 -50 -40 -40 -30; -30 -40 -40 -50 -50 -40 -40 -30; -30 -40 -40 -50 -50 -40 -40 -30; -20 -30 -30 -40 -40 -30 -30 -20; -10 -20 -20 -20 -20 -20 -20 -10; 20 20 0 0 0 0 20 20; 20 30 10 0 0 10 30 20]::Matrix{Int64}
const whiteKingEndgameValues = [-50 -40 -30 -20 -20 -30 -40 -50; -30 -20 -10 0 0 -10 -20 -30; -30 -10 20 30 30 20 -10 -30; -30 -10 30 40 40 30 -10 -30; -30 -10 30 40 40 30 -10 -30; -30 -10 20 30 30 20 -10 -30; -30 -30 0 0 0 0 -30 -30; -50 -30 -30 -30 -30 -30 -30 -50]::Matrix{Int64}

const blackPawnValues = [100 100 100 100 100 100 100 100; 105 110 110 80 80 110 110 105; 105 95 90 100 100 90 95 105; 100 100 100 120 120 100 100 100; 105 105 110 125 125 110 105 105; 110 110 120 130 130 120 110 110; 150 150 150 150 150 150 150 150; 100 100 100 100 100 100 100 100]::Matrix{Int64}
const blackKnightValues = [270 280 290 290 290 290 280 270; 280 300 320 325 325 320 300 280; 290 325 330 335 335 330 325 290; 290 320 335 340 340 335 320 290; 290 325 335 340 340 335 325 290; 290 320 330 335 335 330 320 290; 280 300 320 320 320 320 300 280; 270 280 290 290 290 290 280 270]::Matrix{Int64}
const blackBishopValues = [310 320 320 320 320 320 320 310; 320 335 330 330 330 330 335 320; 320 340 340 340 340 340 340 320; 320 330 340 340 340 340 330 320; 320 335 335 340 340 335 335 320; 320 330 335 340 340 335 330 320; 320 330 330 330 330 330 330 320; 310 320 320 320 320 320 320 310]::Matrix{Int64}
const blackRookValues = [500 500 500 505 505 500 500 500; 495 500 500 500 500 500 500 495; 495 500 500 500 500 500 500 495; 495 500 500 500 500 500 500 495; 495 500 500 500 500 500 500 495; 495 500 500 500 500 500 500 495; 505 510 510 510 510 510 510 505; 500 500 500 500 500 500 500 500]::Matrix{Int64}
const blackQueenValues = [880 890 890 895 895 890 890 880; 890 900 905 900 900 900 900 890; 890 905 905 905 905 905 900 890; 900 900 905 905 905 905 900 895; 895 900 905 905 905 905 900 895; 890 900 905 905 905 905 900 890; 890 900 900 900 900 900 900 890; 880 -890 890 895 895 890 890 880]::Matrix{Int64}
const blackKingMiddelgameValues = [20 30 10 0 0 10 30 20; 20 20 0 0 0 0 20 20; -10 -20 -20 -20 -20 -20 -20 -10; -20 -30 -30 -40 -40 -30 -30 -20; -30 -40 -40 -50 -50 -40 -40 -30; -30 -40 -40 -50 -50 -40 -40 -30; -30 -40 -40 -50 -50 -40 -40 -30; -30 -40 -40 -50 -50 -40 -40 -30]::Matrix{Int64}
const blackKingEndgameValues = [-50 -30 -30 -30 -30 -30 -30 -50; -30 -30 0 0 0 0 -30 -30; -30 -10 20 30 30 20 -10 -30; -30 -10 30 40 40 30 -10 -30; -30 -10 30 40 40 30 -10 -30; -30 -10 20 30 30 20 -10 -30; -30 -20 -10 0 0 -10 -20 -30; -50 -40 -30 -20 -20 -30 -40 -50]::Matrix{Int64}
