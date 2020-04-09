
# Sequence Overview

```mermaid
sequenceDiagram
    participant Powershell
    participant PC(ClipBoard)
    participant HTML
    participant USER

    loop モニター
    Powershell->>PC(ClipBoard): 一定期間監視
    Powershell->>Powershell: コピー検知
    end
    Powershell->>HTML: コピーテキスト書き込み
    USER->>+HTML: ブラウザで確認
```
