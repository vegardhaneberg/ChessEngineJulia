
using Chess
include("./PieceValueMatrices.jl")

board = startboard()
whitePawns = toarray(pawns(board, Chess.WHITE))

println("Matrix multiplication: ", sum(whitePawns.*whitePawnValues))
println("Fasit: ", 105 + 110 + 110 + 80 + 80 + 110 + 110 + 105)
