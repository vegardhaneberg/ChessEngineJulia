
# export PATH="/Applications/Julia-1.8.app/Contents/Resources/julia/bin:$PATH"

using Printf
using Chess
using BenchmarkTools
include("./PieceValueMatrices.jl")

function evaluationFunction(board::Chess.Board)::Float64
    if ischeckmate(board)
        if sidetomove(board) == Chess.BLACK
            return 10000.0
        end
        if sidetomove(board) == Chess.WHITE
            return -10000.0
        end
        if isdraw(board)
            return 0
        end
    end

    whitePawns = sum(toarray(pawns(board, Chess.WHITE)).*whitePawnValues)
    whiteRooks = sum(toarray(rooks(board, Chess.WHITE)).*whiteRookValues)
    whiteKnights = sum(toarray(knights(board, Chess.WHITE)).*whiteKnightValues)
    whiteBishops = sum(toarray(bishops(board, Chess.WHITE)).*whiteBishopValues)
    whiteQueens = sum(toarray(queens(board, Chess.WHITE)).*whiteQueenValues)

    blackPawns = sum(toarray(pawns(board, Chess.BLACK)).*blackPawnValues)
    blackRooks = sum(toarray(rooks(board, Chess.BLACK)).*blackRookValues)
    blackKnights = sum(toarray(knights(board, Chess.BLACK)).*blackKnightValues)
    blackBishops = sum(toarray(bishops(board, Chess.BLACK)).*blackBishopValues)
    blackQueens = sum(toarray(queens(board, Chess.BLACK)).*blackQueenValues)

    whiteScore = whitePawns + whiteRooks + whiteKnights + whiteBishops + whiteQueens
    blackScore = blackPawns + blackRooks + blackKnights + blackBishops + blackQueens

    return whiteScore - blackScore
end

function minimax(board::Chess.Board, depth::Int64, alpha::Float64, betha::Float64)::Tuple{Float64, Chess.Move}
    if depth == 0 || isterminal(board)
        return evaluationFunction(board), moves(board)[1]
    end
    legalMoves = moves(board)

    if sidetomove(board) == Chess.WHITE
        bestMove = legalMoves[1]::Chess.Move
        bestEval = -10000.0

        for currentMove in legalMoves
            currentBoard = domove(board, currentMove)
            currentEval, move = minimax(currentBoard, depth-1, alpha, betha)

            if currentEval > bestEval
                bestMove = currentMove
                bestEval = currentEval
            end
            alpha = max(alpha, currentEval)
            if alpha >= betha
                break
            end
        end
        return bestEval, bestMove
    else
        bestMove = legalMoves[1]::Chess.Move
        bestEval = 10000.0
        for currentMove in legalMoves
            currentBoard = domove(board, currentMove)
            currentEval, move = minimax(currentBoard, depth-1, alpha, betha)

            if currentEval < bestEval
                bestEval = currentEval
                bestMove = currentMove
            end
            betha = min(betha, currentEval)
            if alpha >= betha
                break
            end
        end
        return bestEval, bestMove
    end
end

function improvedMiniMax(board, depth, alpha, betha)
    if depth == 0 || isterminal(board)
        return evaluationFunction(board)
    end
    legalMoves = moves(board)

    if sidetomove(board) == Chess.WHITE
        bestMove = legalMoves[1]
        bestEval = -10000.0

        for currentMove in legalMoves
            currentBoard = domove(board, currentMove)
            currentEval  = improvedMiniMax(currentBoard, depth-1, alpha, betha)

            if currentEval > bestEval
                bestMove = currentMove
                bestEval = currentEval
            end
            alpha = max(alpha, currentEval)
            if alpha >= betha
                break
            end
        end
        return bestEval
    else
        bestMove = legalMoves[1]
        bestEval = 10000.0
        for currentMove in legalMoves
            currentBoard = domove(board, currentMove)
            currentEval = improvedMiniMax(currentBoard, depth-1, alpha, betha)

            if currentEval < bestEval
                bestEval = currentEval
                bestMove = currentMove
            end
            betha = min(betha, currentEval)
            if alpha >= betha
                break
            end
        end
        return bestEval
    end
end

function playGame()
    board = startboard()
    playOn = true

    depth = 4

    while playOn
        println("Write your move [e2e4]:")
        userMoveString = readline()

        if userMoveString == "exit"
            break
        end
        try
            userMove = movefromstring(userMoveString)
            domove!(board, userMove)

            computerEval, computerMove = minimax(board, depth, -10000.0, 10000.0)
            domove!(board, computerMove)
            println(board)
            println("Best move: ", computerMove)
            println("Current Evaluation: ", computerEval)
            println("-----------------------")
        catch
            println("Illegal move. Try again.")
            donullmove!(board)
        end
    end
end

# playGame()
board = fromfen("6r1/p3k2p/2npbp2/1pB1p1Q1/2PPB3/5q2/PKP2P2/8 w - - 3 26")
# improvedMiniMax(board, 2, -10000.0, 10000.0)
@time minimax(board, 4, -10000.0, 10000.0)
@time minimax(board, 4, -10000.0, 10000.0)

# checkMateBoard = fromfen("r1bqkbnr/ppp2Qpp/2np4/4p3/2B1P3/8/PPPP1PPP/RNB1K1NR b KQkq - 0 1")
# startBoard = startboard()
# board = fromfen("r1bqkb1r/pppp1ppp/2n2n2/4p2Q/2B1P3/8/PPPP1PPP/RNB1K1NR w KQkq - 0 1")
# mateInTwoBoard = fromfen("6k1/2B1bppp/p7/1p1r4/8/2Pn1pPq/PPQ2P1P/R5RK b - - 0 1")

#=
ruyLopezBoard = fromfen("r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 0 1")
println("Starting minimax from this board:")
println(ruyLopezBoard)
println("-----------------------")
e, m = minimax(ruyLopezBoard, 6, -Inf16, Inf16)

print("Best move: ")
println(m)
print("Evaluation: ")
println(e)
=#
