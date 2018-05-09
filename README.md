# 소개

![Ethereum_Truffle](/assets/ethereum_truffle.jpg)

이 프로젝트에 대한 자세한 문서는 [여기](https://dangen-effy.github.io/2018/05/08/dApp-with-Truffle01.html)에서 확인하세요.

Truffle 을 이용한 입출금 가능한 이더리움 은행입니다.

# 준비물

* Node.js
* Truffle
* Ganache

# 사용법

먼저 `Ganache` 를 `7545` 포트에 가동시킵니다.

우리는 프론트엔드 없이 콘솔 환경 실습합니다.

```
> truffle console
truffle(development)>
```

이제 `Deploy` 한 `Contract` 의 인스턴스를 변수에 저장합니다:

```
truffle(development)> Bank.deployed().then(instance => bank = instance)
```

`Bank.deployed()` 는 `Contract` 의 인스턴스 평가하는 프로미스(`Promise`)를 반환합니다. `then` 을 이용하여 우리는 이를 `bank` 에 `bind` 합니다.

`owner` 멤버 변수를 확인해봅시다:

```
> bank.owner()
'0xdaf72fcee99c3ed561b5f91a83b69c6f3d6b02e8'
```

`Ganache` 의 첫 번째 계정과 `address` 가 동일합니다!

이제 은행에 `10 ETH` 만큼 입금을 해봅시다:

```
> bank.deposit({value: web3.toWei(10, 'ether')})
```

`deposit` 은 `payable` 함수입니다. 때문에 저희는 `value` 를 매개 변수로 담을 수 있습니다. `value` 는 `ETH` 의 최소 단위인 `Wei` 를 가집니다. 따라서 `web3.toWei` 를 통해 `10 ETH` 를 `Wei` 로 변환해야합니다.

이제 `Ganache` 의 첫 번째 계정의 잔액(`balance`)을 확인합니다:

![Ganache_First_Account](/assets/ganache_1st_account.jpg)

`89.94 ETH` 가 남았습니다. 왜 `90.00 ETH` 가 아닐까요? 이는 `Contract` 의 함수를 실행시키는 수수료(`Gas`) 때문입니다. `Gas` 에 대한 자세한 내용은 [여기](http://ethdocs.org/en/latest/contracts-and-transactions/account-types-gas-and-transactions.html)를 참고하세요.

이제 출금할 차례입니다:

```
> bank.withdraw()
```

![Ganache_First_Account](/assets/ganache_2nd_account.jpg)

첫 번째 계정에 `10 ETH` 가 다시 들어왔습니다!

[더 읽어보기](https://dangen-effy.github.io/2018/05/08/dApp-with-Truffle01.html)
