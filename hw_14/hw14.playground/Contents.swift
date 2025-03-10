
import Foundation
do {
    func testQueue() {
        print("1")
        DispatchQueue.main.async {
            print("2")
            DispatchQueue.global(qos: .userInteractive).sync {
                print("3")
                DispatchQueue.main.async {
                    print("4")
                    DispatchQueue.global(qos: .background).async {
                        print("5")
                    }
                    print("6")
                }
                print("7")
            }
            print("8")
        }
        print("9")
    }

    
    testQueue()
    
    
}
