import QtQuick 2.11
import QtQuick.Controls 2.2

import Device 0.1

Page {

property bool deviceState: device.state

    Device {
        id: device
    }

//    Canvas {
//        id: mycanvas

//        width: parent.width
//        height: 1000
//        onPaint: {


//            var data = "1111111111111111111111111111111111111111111111100000001111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000011111100011111111100000111111111100111111111111110111111111111111111110111100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000111111111111111111111111111111111111111111111111111111111111111111111111111000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001111111111111111111100011111111100000011111111011111111111100001111100001110000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000011111111111111000000000000000000000000000000000000000000001100000000000000000000000000000000000011111000010000000111110000000000000000000000000000000000000000110000000000000000000000000000000001111000000001000000000001111000000000000000000000000000000000000011000000000000000000000000000000011100000000000100000000000000111000000000000000000000000000000000001100000000000000000000000000000011000000000000010000000000000000110000000000000000000000000000000000110000000000000000000000000000011000000000000001000000000000000001100000000000000000000000000000000011000000000000000000000000000011000000000000000100000000000000000011000000000000000000000000000000001100000000000000000000000000011000000000000000010000000000000000000110000000000000000000000000000000110000000000000000000000000001000000000000000001000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000011000000000000000000000000000110000000000000000100000000000000000001100000000000000000000000000000001100000000000000000000000000001100000000000000010000000000000000001100000000000000000000000000000000110000000000000000000000000000011000000000000001000000000000000001100000000000000000000000000000000011000000000000000000000000000000110000000000000100000000000000001100000000000000000000000000000000001100000000000000000000000000000001110000000000010000000000000011100000000000000000000000000000000000110000000000000000000000000000000001111000000001000000000001111000000000000000000000000000000000000011000000000000000000000000000000000000111110000100000001111100000000000000000000000000000000000000001100000000000000000000000000000000000000001111111111111100000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000011111100011111111100000111111111100111111111111110111111111111111111110111100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000111111111111111111111111111111111111111111111111111111111111111111111111111000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001111111111111111111100011111111100000011111111011111111111100001111100001110000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
//            console.log("SIZE",data.length)
//            var ctx = getContext("2d");
//            ctx.beginPath();
//            var count = 0;
//            y = 0
//            for(var x=0; x<10000; x++) {

//                    count++;
//                    if(count > 99){
//                        count =0;
//                        y++;
//                    }
//                    else{
//                        count++;
//                    }

//                    if(data[x] === "1"){
//                        console.log("ONES", data[x])

//                        ctx.moveTo(x,y)
//                        ctx.lineTo(x+20,y)
//                        ctx.strokeStyle="#000000";
//                        ctx.stroke();
//                    }
//                    else{
//                        console.log("ZEROS", data[x])
//                        ctx.moveTo(x,y)
//                        ctx.lineTo(x,y)
//                        ctx.strokeStyle="#FFFFFF";
//                        ctx.stroke();

//                    }

//            }
//        }
//    }


Image {
    id: imageMap
    //source: "qrc:/icons/map.jpeg"
    source: "qrc:/icons/last.jpeg"
    width: height = parent.width

    Timer {
        id: timeDevice
        interval: 500; running: true; repeat: true
        onTriggered: {
            device.startDeviceDiscovery();
             //if startDeviceDiscovery() failed device.state is not set
            if (device.state) {
                deviceBusy.visible = true
               // info.visible = true;
            }

            updateBubble(device.devicesList);
        }
    }

    Component.onCompleted: {
          timeDevice.start()
    }

    Rectangle {
        id: bubble
        width: height = 18
        color: 'red'
        radius: 9

        Component.onCompleted: {
            blink.start()
        }

        PropertyAnimation {
            id: blink
            property: 'opacity'; duration: 200; target: bubble
            from: 0; to: 1; loops: Animation.Infinite
        }

        //source: "content/Bluebubble.svg"
        smooth: true
        property real centerX: parent.width / 2
        property real centerY: parent.height / 2
        property real bubbleCenter: bubble.width / 2
        x: centerX - bubbleCenter
        y: centerY - bubbleCenter

        Behavior on y {
            SmoothedAnimation {
                easing.type: Easing.Linear
                duration: 100
            }
        }
        Behavior on x {
            SmoothedAnimation {
                easing.type: Easing.Linear
                duration: 100
            }
        }
    }
}

ListView {
    id: theListView
    width: parent.width

    clip: true

    anchors.top: imageMap.bottom
    anchors.bottom: parent.bottom
    model: device.devicesList



    BusyIndicator {
        id: deviceBusy
        anchors.centerIn: parent
        visible: false
    }

    delegate: Rectangle {
        id: box
        height:100
        width: parent.width
        color: "lightsteelblue"
        border.width: 2
        border.color: "darkgrey"
        radius: 5

        Component.onCompleted: {
            deviceBusy.visible = false
            //info.visible = false;
            //header.headerText = "Select a device";
        }

        MouseArea {
            anchors.fill: parent
//            onClicked: {
//                device.scanServices(modelData.deviceAddress);
//                pageLoader.source = "Services.qml"
//            }
        }

        Label {
            id: deviceName
            text: modelData.deviceNumber + "   "+ modelData.deviceRssi
            anchors.top: parent.top
            anchors.topMargin: 5
        }

        Label {
            id: deviceAddress
            text: modelData.deviceAddress
            font.pointSize: deviceName.font.pointSize*0.7
            anchors.bottom: box.bottom
            anchors.bottomMargin: 5
        }


    }
}

function updateBubble(deviceList) {
    var sum = 0
    var average = 0
    var latest_Rssi = []
    for(var i =0; i < deviceList.length; i++) {
//        console.log(deviceList[i].deviceRssi)
         sum += deviceList[i].deviceRssi
        latest_Rssi[deviceList[i].deviceNumber] = deviceList[i].deviceRssi
    }

    var average = sum / deviceList.length

    console.log("Latest_RSSI", latest_Rssi)


    var measured_power = -60
    var N = 5
    var d1 = parseFloat(10^parseFloat(((measured_power - latest_Rssi[1])/(10*N))))
    var d2 = parseFloat(10^parseFloat(((measured_power - latest_Rssi[2])/(10*N))))
    var d3 = parseFloat(10^parseFloat(((measured_power - latest_Rssi[3])/(10*N))))
    var d4 = parseFloat(10^parseFloat(((measured_power - latest_Rssi[4])/(10*N))))
    //var d5 = 10^((measured_power - latest_Rssi[5])/(10*N))

    console.log("Ds", d1, d2, d3, d4)

    var anchor_x1_y1 = [0,0]
    var anchor_x2_y2 = [10,0]
    var anchor_x3_y3 = [10,10]
    var anchor_x4_y4 = [0,10]
    //var anchor_x5_y5 = [10,5]

    var A = [[anchor_x2_y2[0] - anchor_x1_y1[0], anchor_x2_y2[1] - anchor_x1_y1[1]],
            [anchor_x3_y3[0] - anchor_x1_y1[0], anchor_x3_y3[1] - anchor_x1_y1[1]],
             [anchor_x4_y4[0] - anchor_x1_y1[0], anchor_x4_y4[1] - anchor_x1_y1[1]]
            ]

    var k1,k2,k3,k4

    k1 = (anchor_x1_y1[0])^2 + (anchor_x1_y1[1])^2
    k1 = (anchor_x2_y2[0])^2 + (anchor_x2_y2[1])^2
    k1 = (anchor_x3_y3[0])^2 + (anchor_x3_y3[1])^2
    k1 = (anchor_x4_y4[0])^2 + (anchor_x4_y4[1])^2

    var B = [[d1^2 - d2^2-k1+k2],
            [d1^2 - d3^2-k1+k3],
             [d1^2 - d4^2-k1+k4]
            ]


    var r = multiplyMatrices(matrix_invert(multiplyMatrices(transpose(A), A)), multiplyMatrices(transpose(A), B))

    console.log(r[0], r[1])

    if(r[0] < 0 || r[1] < 0 )
        return
    bubble.x = parseInt(r[0])
    bubble.y = parseInt(r[1])

}


function transpose(a) {

  // Calculate the width and height of the Array
  var w = a.length || 0;
  var h = a[0] instanceof Array ? a[0].length : 0;

  // In case it is a zero matrix, no transpose routine needed.
  if(h === 0 || w === 0) { return []; }

  /**
   * @var {Number} i Counter
   * @var {Number} j Counter
   * @var {Array} t Transposed data is stored in this array.
   */
  var i, j, t = [];

  // Loop through every item in the outer array (height)
  for(i=0; i<h; i++) {

    // Insert a new row (array)
    t[i] = [];

    // Loop through every item per item in outer array (width)
    for(j=0; j<w; j++) {

      // Save transposed data.
      t[i][j] = a[j][i];
    }
  }

  return t;
}

// Returns the inverse of matrix `M`.
function matrix_invert(M){
    // I use Guassian Elimination to calculate the inverse:
    // (1) 'augment' the matrix (left) by the identity (on the right)
    // (2) Turn the matrix on the left into the identity by elemetry row ops
    // (3) The matrix on the right is the inverse (was the identity matrix)
    // There are 3 elemtary row ops: (I combine b and c in my code)
    // (a) Swap 2 rows
    // (b) Multiply a row by a scalar
    // (c) Add 2 rows

    //if the matrix isn't square: exit (error)
    if(M.length !== M[0].length){return;}

    //create the identity matrix (I), and a copy (C) of the original
    var i=0, ii=0, j=0, dim=M.length, e=0, t=0;
    var I = [], C = [];
    for(i=0; i<dim; i+=1){
        // Create the row
        I[I.length]=[];
        C[C.length]=[];
        for(j=0; j<dim; j+=1){

            //if we're on the diagonal, put a 1 (for identity)
            if(i==j){ I[i][j] = 1; }
            else{ I[i][j] = 0; }

            // Also, make the copy of the original
            C[i][j] = M[i][j];
        }
    }

    // Perform elementary row operations
    for(i=0; i<dim; i+=1){
        // get the element e on the diagonal
        e = C[i][i];

        // if we have a 0 on the diagonal (we'll need to swap with a lower row)
        if(e==0){
            //look through every row below the i'th row
            for(ii=i+1; ii<dim; ii+=1){
                //if the ii'th row has a non-0 in the i'th col
                if(C[ii][i] != 0){
                    //it would make the diagonal have a non-0 so swap it
                    for(j=0; j<dim; j++){
                        e = C[i][j];       //temp store i'th row
                        C[i][j] = C[ii][j];//replace i'th row by ii'th
                        C[ii][j] = e;      //repace ii'th by temp
                        e = I[i][j];       //temp store i'th row
                        I[i][j] = I[ii][j];//replace i'th row by ii'th
                        I[ii][j] = e;      //repace ii'th by temp
                    }
                    //don't bother checking other rows since we've swapped
                    break;
                }
            }
            //get the new diagonal
            e = C[i][i];
            //if it's still 0, not invertable (error)
            if(e==0){return}
        }

        // Scale this row down by e (so we have a 1 on the diagonal)
        for(j=0; j<dim; j++){
            C[i][j] = C[i][j]/e; //apply to original matrix
            I[i][j] = I[i][j]/e; //apply to identity
        }

        // Subtract this row (scaled appropriately for each row) from ALL of
        // the other rows so that there will be 0's in this column in the
        // rows above and below this one
        for(ii=0; ii<dim; ii++){
            // Only apply to other rows (we want a 1 on the diagonal)
            if(ii==i){continue;}

            // We want to change this element to 0
            e = C[ii][i];

            // Subtract (the row above(or below) scaled by e) from (the
            // current row) but start at the i'th column and assume all the
            // stuff left of diagonal is 0 (which it should be if we made this
            // algorithm correctly)
            for(j=0; j<dim; j++){
                C[ii][j] -= e*C[i][j]; //apply to original matrix
                I[ii][j] -= e*I[i][j]; //apply to identity
            }
        }
    }

    //we've done all operations, C should be the identity
    //matrix I should be the inverse:
    return I;
}

function multiplyMatrices(a, b) {
    if (!Array.isArray(a) || !Array.isArray(b) || !a.length || !b.length) {
        throw new Error('arguments should be in 2-dimensional array format');
    }

    var x = a.length,
        z = a[0].length,
        y = b[0].length;

    if (b.length !== z) {
        // XxZ & ZxY => XxY
        throw new Error('number of columns in the first matrix should be the same as the number of rows in the second');
    }

    var productRow = Array.apply(null, new Array(y)).map(Number.prototype.valueOf, 0);
    var product = new Array(x);
    for (var p = 0; p < x; p++) {
        product[p] = productRow.slice();
    }

    for (var i = 0; i < x; i++) {
        for (var j = 0; j < y; j++) {
            for (var k = 0; k < z; k++) {
                product[i][j] += a[i][k] * b[k][j];
            }
        }
    }

    return product;
}

}
