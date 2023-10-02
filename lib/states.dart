abstract class GameStates{}

class GameInitialState extends GameStates{}
class ChangeGridGameState extends GameStates{}
class ErrorChangGridGameState extends GameStates{}
class ChangeTurnGameState extends GameStates{}
class ClearGridGameState extends GameStates{}
class WinnerGameState extends GameStates{}
class DrawGameState extends GameStates{}