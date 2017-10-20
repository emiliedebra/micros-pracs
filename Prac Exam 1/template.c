// to cycle LEDs through an array
if (i == sizeof(#arrayname)) {
  i = 0;
}
GPIOB->ODR = #arrayname[i];
i++;
