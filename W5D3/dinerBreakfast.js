function dinerBreakfast() {
  let order = "I\'d like cheesy scrambled eggs";

  return (items) => {
    if (items !== undefined) {
      order += " and " + items;
    }

    return `${order} please.`;
  };
}
