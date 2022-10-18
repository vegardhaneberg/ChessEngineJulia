
# export PATH="/Applications/Julia-1.8.app/Contents/Resources/julia/bin:$PATH"

using Printf
using Chess
include("./PieceBordValues.jl")

function evaluationFunction(board)
    if ischeckmate(board)
        if sidetomove(board) == Chess.BLACK
            return Inf16
        end
        if sidetomove(board) == Chess.WHITE
            return -Inf16
        end
        if isdraw(board)
            return 0
        end
    end

    whitePawns = length(squares(pawns(board, Chess.WHITE)))
    whiteRooks = length(squares(rooks(board, Chess.WHITE)))
    whiteKnights = length(squares(knights(board, Chess.WHITE)))
    whiteBishops = length(squares(bishops(board, Chess.WHITE)))
    whiteQueens = length(squares(queens(board, Chess.WHITE)))

    blackPawns = length(squares(pawns(board, Chess.BLACK)))
    blackRooks = length(squares(rooks(board, Chess.BLACK)))
    blackKnights = length(squares(knights(board, Chess.BLACK)))
    blackBishops = length(squares(bishops(board, Chess.BLACK)))
    blackQueens = length(squares(queens(board, Chess.BLACK)))

    whiteScore = whitePawns*100 + whiteKnights*320 + whiteBishops*330 + whiteRooks*500 + whiteQueens*900
    blackScore = blackPawns*100 + blackKnights*320 + blackBishops*330 + blackRooks*500 + blackQueens*900

    return whiteScore - blackScore
end

function minimax(board, depth, alpha, betha)
    if depth == 0 || isterminal(board)
        return evaluationFunction(board), nothing
    end
    legalMoves = moves(board)

    if sidetomove(board) == Chess.WHITE
        bestMove = nothing
        bestEval = -Inf16

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
        bestMove = nothing
        bestEval = Inf16
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

        userMove = movefromstring(userMoveString)
        domove!(board, userMove)

        computerEval, computerMove = minimax(board, depth, -Inf16, Inf16)
        domove!(board, computerMove)
        println(board)
        print("Current Evaluation: ")
        println(computerEval)
        println("-----------------------")
    end
end

playGame()

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
