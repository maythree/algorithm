
import Foundation

import RxSwift
import RxCocoa


//https://medium.com/ios-forever/rxswift-%EA%B8%B0%EB%B3%B8-%EC%9D%B5%ED%9E%88%EA%B8%B0-1-d4d77ce63ca8
//https://medium.com/ios-forever/rxswift-%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-2-9%EB%B6%84-59-%EC%B4%88-f42f28407e75


class ObservableTest : NSObject {
    
    public func printResult() -> String {
        publishSubject()
        return ""
    }
    
    public func sample() {
        let stringSequence = Observable.just("this is string yo")
        let oddSequence = Observable.from([1, 3, 5, 7, 9])
        let dictSequence = Observable.from([1:"Rx",2:"Swift"])
        
        let subscription1 = stringSequence.subscribe { (event: Event<String>) in
            print(event)
        }
        let subscription2 = oddSequence.subscribe { (event: Event<Int>) in
            print(event)
        }
        
        //        let subscription3 = dictSequence.subscribe { (event: Event<Dictionary<Int,String>>) in
        //            let aa = event
        //            print(event)
        //            //print(event)
        //        }
    }
    
    public func create()  {
        func myJust<E>(element: E) -> Observable<E> {
            return Observable.create { observer in
                observer.on(.next(element))
                observer.on(.completed)
                return Disposables.create()
            }
        }
        myJust(element: "My Just Observable")
            .subscribe { s in
                print(s)
        }
    }

    public func disposing()  {
        /*
         subscribe 메서드는 Disposable 인스턴스를 리턴합니다.
         Observable의 사용이 끝나면 메모리를 해제해야 합니다. 그 때 사용할 수 있는것이 Dispose입니다.
         RxSwift에서는 DisposeBag을 사용하는데 DisposeBag instance의 deinit() 이 실행 될 때 모든 메모리를 해제합니다.
         이 DisposeBag 에 subscribe 가 리턴하는 Disposable 인스턴스를 넣어주기만 하면 됩니다.
        */
        var disposeBag = DisposeBag()
        let stringSequence = Observable.just("RxSwift Observable")
        let subscription = stringSequence.subscribe { (event) in
            print(event)
        }
        // subscription 을 disposeBag에 넣어 메모리를 해제합니다.
        subscription.disposed(by: disposeBag)
        // 빠르게 비워주고 싶을때는 disposeBag을 새로 만들면 됩니다.
        disposeBag = DisposeBag()
    }
    
    public func publishSubject()  {
        let bag = DisposeBag()
        var publishSubject = PublishSubject<String>()
        publishSubject.onNext("very first value")
        publishSubject.subscribe { (event) in
            print(event)
        }
        publishSubject.onNext("first value")
        publishSubject.onNext("second value")
        let error = NSError(domain:"error", code:401, userInfo:[ NSLocalizedDescriptionKey: "Invaild access token"])
        publishSubject.onError(error)
        publishSubject.onNext("very last value")
        publishSubject.onCompleted()
        // --- 출력 ---
        // next(first value)
        // next(second value)
        // error(test)
    }
    
    public func sampleTest()  {
        let disposeBag = DisposeBag()
        // ===== never =====
        let neverSequence = Observable<String>.never()
        let neverSequenceSubscription = neverSequence
            .subscribe { _ in
                print("This will never be printed")
        }
        neverSequenceSubscription.disposed(by: disposeBag)
        // ===== empty =====
        Observable<Int>.empty()
            .subscribe { event in
                print(event)
            }
            .disposed(by: disposeBag)
        // ===== of =====
        Observable.of("🐶", "🐱", "🐭", "🐹")
            .subscribe(onNext: { element in
                print(element)
            })
            .disposed(by: disposeBag)
        // ===== range =====
        Observable.range(start: 1, count: 10)
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        // ===== repeatElement =====
        Observable.repeatElement("🔴")
            .take(3)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        // ===== generate =====
        Observable.generate(
            initialState: 0,
            condition: { $0 < 3 },
            iterate: { $0 + 1 }
            )
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        // ===== deferred =====
        var count = 1
        let deferredSequence = Observable<String>.deferred {
            print("Creating \(count)")
            count += 1
            
            return Observable.create { observer in
                print("Emitting...")
                observer.onNext("🐶")
                observer.onNext("🐱")
                observer.onNext("🐵")
                return Disposables.create()
            }
        }
        deferredSequence
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        deferredSequence
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        // ===== error =====
//        Observable<Int>.error(TestError.test)
//            .subscribe { print($0) }
//            .disposed(by: disposeBag)
        // ===== doOn =====
        Observable.of("🍎", "🍐", "🍊", "🍋")
            .do(onNext: { print("Intercepted:", $0) },
                onError: { print("Intercepted error:", $0) },
                onCompleted: { print("Completed")  })
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    
}

