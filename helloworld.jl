
# export PATH="/Applications/Julia-1.8.app/Contents/Resources/julia/bin:$PATH"

using Printf
using Chess

function evaluationFunction(board)
    if ischeckmate(board)
        if sidetomove(board) == Chess.BLACK
            return -999999
    end
end
#=
    result = board.result()
    if result == '1-0':
        return math.inf
    elif result == '0-1':
        return -math.inf
    else:
        return 0
=#

function minimax(board, depth, alpha, betha)
    if depth == 0 || isterminal(board)
        return 0
    end
    legalMoves = moves(board)
    board2 = domove(board, legalMoves[1])
end


board = fromfen("r1bqkbnr/ppp2Qpp/2np4/4p3/2B1P3/8/PPPP1PPP/RNB1K1NR b KQkq - 0 1")

# board = minimax(board, 3, 1000, -1000)
println(ischeckmate(board))
println(sidetomove(board) == Chess.BLACK)
print(typeof(sidetomove(board)))

#=
def minmax(board, depth, alpha, betha):

    if depth == 0 or board.is_game_over():
        return evaluation_function(board), None

    legal_moves = board.legal_moves

    if board.turn:
        best_move = None
        best_eval = -math.inf

        for current_move in legal_moves:
            board_copy = board.copy()
            board_copy.push(current_move)
            current_eval, move = minmax(board_copy, depth - 1, alpha, betha)

            if current_eval > best_eval:
                best_move = current_move
                best_eval = current_eval
            alpha = max(alpha, current_eval)
            if alpha >= betha:
                break
        return best_eval, best_move

    else:
        best_move = None
        best_eval = math.inf

        for current_move in legal_moves:
            board_copy = board.copy()
            board_copy.push(current_move)
            current_eval, move = minmax(board_copy, depth - 1, alpha, betha)

            if current_eval < best_eval:
                best_eval = current_eval
                best_move = current_move

            betha = min(betha, current_eval)
            if alpha >= betha:
                break
        return best_eval, best_move
=#
