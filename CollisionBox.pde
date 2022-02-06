class CollisionBox {
  // A collision box has a location and a size
  protected float x;
  protected float y;
  protected float w;
  protected float h;

  // Constructor for collision box needs location and size
  CollisionBox(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  // detects if mouse is over box
  boolean mouseOverBox() {

    float left = x;
    float right = x + w;
    float top = y;
    float bottom = y + h;

    // If any of these are true, the mouse is not over the box 
    // If this is false, the mouse IS over the box
    return !(mouseX < left || mouseX > right || mouseY < top || mouseY > bottom);
  }

  // detects if two collision boxes touch
  boolean intersects (CollisionBox otherCollisionBox) {
    float left = x;
    float right =  x + w;
    float top = y;
    float bottom = y + h;

    float oleft = otherCollisionBox.x;
    float oright = otherCollisionBox.x + otherCollisionBox.w;
    float otop = otherCollisionBox.y;
    float obottom = otherCollisionBox.y + otherCollisionBox.h;

    // If any of these are true, they are not intersecting,
    // if this is not true, they are intersecting
    return !(left >= oright ||
      right <= oleft ||
      top >= obottom ||
      bottom <= otop);
  }
}
