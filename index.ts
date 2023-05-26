import { SerialPort } from "serialport";
import fs from "fs";

const portPath = "/dev/tty.usbmodem14101";

const port = new SerialPort({
  path: portPath,
  baudRate: 57600,
});

port.on("data", function (data) {
  const array: number[] = Array.from(data);
  saveValue(array);
});

function saveValue(array: number[]) {
  // arrayが更新されたらdata.jsonに保存する
  const data = fs.readFileSync("data.json", "utf-8");
  const jsontoarray = JSON.parse(data);

  const isSame = array.every((value, index) => {
    return value === jsontoarray[index];
  });

  if (!isSame) {
    console.log("save");
    fs.writeFileSync("data.json", JSON.stringify(array));
  }
}
