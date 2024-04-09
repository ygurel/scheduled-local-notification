import SwiftUI

struct StartTimeStepper: View {
    @State var startTime = 9.0
    let minValue: Double
    let maxValue: Double
    
    init(minValue: Double = 0.0, maxValue: Double = 23.0) {
        self.minValue = minValue
        self.maxValue = maxValue
    }
    
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Button(action: {
                    if startTime > minValue {
                        startTime -= 1
                    } else {
                        startTime = maxValue
                    }
                }){
                    Circle()
                        .fill(Color("ButtonPurple"))
                        .frame(width: 30, height: 30)
                        .overlay(
                            Text("-")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                                .padding(.bottom, 4)
                        )
                }

                Text("\(String(format: "%.2f", startTime).replacingOccurrences(of: ".", with: ":"))")
                    .frame(width: 50)
                
                Button(action: {
                    if startTime < maxValue {
                        startTime += 1
                    } else {
                        startTime = minValue
                    }
                }){
                    Circle()
                        .fill(Color("ButtonPurple"))
                        .frame(width: 30, height: 30)
                        .overlay(
                                Text("+")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25))
                                    .padding(.bottom, 4)
                        )
                }
            }
        }
        .buttonStyle(.plain)
    }
}

struct EndTimeStepper: View {
    @State var endTime = 22.0
    let minValue: Double
    let maxValue: Double
    
    init(minValue: Double = 0.0, maxValue: Double = 23.0) {
        self.minValue = minValue
        self.maxValue = maxValue
    }
    
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Button(action: {
                    if endTime > minValue {
                        endTime -= 1
                    } else {
                        endTime = maxValue
                    }
                }){
                    Circle()
                        .fill(Color("ButtonPurple"))
                        .frame(width: 30, height: 30)
                        .overlay(
                            Text("-")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                                .padding(.bottom, 4)
                        )
                }

                Text("\(String(format: "%.2f", endTime).replacingOccurrences(of: ".", with: ":"))")
                    .frame(width: 50)
                
                Button(action: {
                    if endTime < maxValue {
                        endTime += 1
                    } else {
                        endTime = minValue
                    }
                }){
                    Circle()
                        .fill(Color("ButtonPurple"))
                        .frame(width: 30, height: 30)
                        .overlay(
                                Text("+")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25))
                                    .padding(.bottom, 4)
                        )
                }
            }
        }
        .buttonStyle(.plain)
    }
}

struct FrequencyStepper: View {
    @State var frequency = 10
    let minValue: Int
    let maxValue: Int
    
    init(minValue: Int = 1, maxValue: Int = 60) {
        self.minValue = minValue
        self.maxValue = maxValue
    }
    
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Button(action: {
                    if frequency > minValue {
                        frequency -= 1
                    } else {
                        frequency = maxValue
                    }
                }){
                    Circle()
                        .fill(Color("ButtonPurple"))
                        .frame(width: 30, height: 30)
                        .overlay(
                            Text("-")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                                .padding(.bottom, 4)
                        )
                }

                Text("\(frequency)")
                    .frame(width: 50)
                
                Button(action: {
                    if frequency < maxValue {
                        frequency += 1
                    } else {
                        frequency = minValue
                    }
                }){
                    Circle()
                        .fill(Color("ButtonPurple"))
                        .frame(width: 30, height: 30)
                        .overlay(
                                Text("+")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25))
                                    .padding(.bottom, 4)
                        )
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    StartTimeStepper()
}

#Preview {
    EndTimeStepper()
}

#Preview {
    FrequencyStepper()
}
