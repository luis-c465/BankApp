/**
 * Dispaly the sidebar for the bank app
 * whitch contains Accounts registered in the bank and at the bottom a button to add a new user
*/
public class Sidebar extends Obj {
  public static final int w = 350;
  public static final color c = #d4d4d4;
  AccountDrawer accDrawer;
  NewAccBtn newAccBtn;

  protected void _update() {
    checkBtns();

    drawBg();
    drawAccounts();

    newAccBtn.update();
  }

  private void drawBg() {
    fill(c);
    shapeMode(CORNERS);
    rect(0, 0, w, v.h);
  }

  private void drawAccounts() {
    for (int i=0; i < v.accounts.size(); i++) {
      accDrawer.draw(i);
    }
  }

  public void _setup() {
    accDrawer = new AccountDrawer(app);

    newAccBtn = new NewAccBtn(app);
    newAccBtn.setup();
  }

  public void mousePressed() {
    for (int i=0; i < v.accounts.size(); i++) {
      accDrawer.mousePressed(i);
    }

    newAccBtn.mousePressed();
  }

  public void checkBtns() {
    if (newAccBtn.clicked) {
      v.newAcc = true;
      println("clicked");
    }
  }

  public Sidebar(BankApp app) { super(app); }
}
