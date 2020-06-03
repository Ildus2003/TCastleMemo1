{ Main user interface class.
  This implements the majority of this application functionality.

  Feel free to use this code as a starting point for your own projects.
  (This code is in public domain, unlike most other CGE code which
  is covered by the LGPL license variant, see the COPYING.txt file.)
  Autor: Ildus Yarullin (IldusEps)
  29.05.2020}
unit GameStateMain;

interface

uses Classes,
  CastleUIState, CastleComponentSerialize, CastleUIControls, CastleControls,
  CastleKeysMouse;

type
  { Main user interface class.
    This implements the majority of this application functionality. }
  TStateMain = class(TUIState)
    Memo:TCastleMemo;
  private
  public
    procedure Start; override;
    procedure Update(const SecondsPassed: Single; var HandleInput: Boolean); override;
    function Press(const Event: TInputPressRelease): Boolean; override;
  end;

var
  StateMain: TStateMain;

implementation

uses SysUtils,
  CastleWindow;

{ TStateMain ----------------------------------------------------------------- }

procedure TStateMain.Start;
var
  UiOwner: TComponent;
begin
  inherited;
 Memo:=TCastleMemo.Create(Application);
 Memo.Anchor(vpMiddle);
  Memo.Anchor(hpMiddle);
  Memo.Height:=600;
  Memo.Width:=800;
  InsertFront(Memo);
  Memo.Text.AddText('property AutoSizeHeight: TCastleMemo height by number of rows'+#13+
'In TCastleScrollViewCustom added the Active Key Home End'+#13+
'and ActiveCtrlHomeEnd properties, describing them in the file itself.'+#13+
''+#13+
'Control the cursor to the right and left. Up to the end using CtrlHome'+#13+
' and CtrlEnd. Everything is like in Lazarus. Using just Home and End. Scrolling'+ #13+
''+#13+
'Paste and copy (but not very good yet, without highlighting)');
end;


procedure TStateMain.Update(const SecondsPassed: Single; var HandleInput: Boolean);
begin

end;

function TStateMain.Press(const Event: TInputPressRelease): Boolean;
begin
  Result := inherited;
  if Result then Exit; // allow the ancestor to handle keys

  { This virtual method is executed when user presses
    a key, a mouse button, or touches a touch-screen.

    Note that each UI control has also events like OnPress and OnClick.
    These events can be used to handle the "press", if it should do something
    specific when used in that UI control.
    The TStateMain.Press method should be used to handle keys
    not handled in children controls.
  }

  if Event.IsKey(keyEscape) then
  begin
    Application.Terminate;
    Exit(true); // key was handled
  end;
end;

end.
