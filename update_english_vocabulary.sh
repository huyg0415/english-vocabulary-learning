#!/bin/bash

# 更新英语词汇网页到iCloud Drive
echo "正在更新英语词汇网页..."

# 读取当前词汇内容
VOCABULARY_CONTENT=$(cat /Users/huyg-macmini/.openclaw/workspace/memory/2026-02-14.md | grep "当前学习词汇" -A 10)

# 生成words数组内容
WORDS_CONTENT=$(cat << 'EOF'
            {
                word: "Relay",
                phonetic: "[ˈriːleɪ]",
                type: "Verb / Noun",
                definition: "中继；转播；接力",
                sentence_en: "Satellites <b>relay</b> signals across the ocean.",
                sentence_cn: "卫星将信号转播到大洋彼岸。",
                memory_hook: "想象接力赛跑 (Relay race)，棒子被\"传递/中继\"给下一个人。",
                color: "#74b9ff"
            },
            {
                word: "Jam",
                phonetic: "[dʒæm]",
                type: "Noun / Verb",
                definition: "果酱；堵塞；卡住",
                sentence_en: "The printer paper is <b>jammed</b> again.",
                sentence_cn: "打印机纸张又卡住了。",
                memory_hook: "Traffic jam (交通堵塞) 就像瓶子里的果酱 (Jam) 一样挤得满满的。",
                color: "#ff7675"
            },
            {
                word: "Agent",
                phonetic: "[ˈeɪdʒənt]",
                type: "Noun",
                definition: "代理人；特工；动因",
                sentence_en: "He works as a real estate <b>agent</b>.",
                sentence_cn: "他是一名房地产经纪人。",
                memory_hook: "007 is a secret <b>agent</b>. (007是个秘密特工)。",
                color: "#a29bfe"
            },
            {
                word: "Markdown",
                phonetic: "[ˈmɑːkdəʊn]",
                type: "Noun",
                definition: "标记语言；减价",
                sentence_en: "GitHub README files use <b>Markdown</b>.",
                sentence_cn: "GitHub的自述文件使用Markdown编写。",
                memory_hook: "Mark (标记) + Down (写下/降价)。程序员写文档的利器。",
                color: "#2d3436"
            },
            {
                word: "vocab",
                phonetic: "[ˈvækb]",
                type: "Noun",
                definition: "词汇，词汇表，词汇量",
                sentence_en: "Building your <b>vocab</b> is essential for language learning.",
                sentence_cn: "建立词汇量对语言学习至关重要。",
                memory_hook: "Vocab (vocabulary) 就是你的词汇库，像图书馆一样丰富。",
                color: "#55efc4"
            },
            {
                word: "tradeoff",
                phonetic: "[ˈtreɪdɒf]",
                type: "Noun",
                definition: "权衡，妥协，取舍",
                sentence_en: "There's always a <b>tradeoff</b> between speed and quality.",
                sentence_cn: "速度和质量之间总是需要权衡。",
                memory_hook: "Trade (交易) + off (离开) = 交易离开 = 权衡取舍",
                color: "#fd79a8"
            },
            {
                word: "telegram",
                phonetic: "[ˈtelɪɡræm]",
                type: "Noun",
                definition: "电报，电文；Telegram聊天软件",
                sentence_en: "The <b>telegram</b> arrived early in the morning.",
                sentence_cn: "电报一大早就收到了。",
                memory_hook: "Tele（远距离）+ gram（文字）= 远距离传递的文字 = 电报",
                color: "#74b9ff"
            },
            {
                word: "vibe coding",
                phonetic: "[vaɪb ˈkəʊdɪŋ]",
                type: "Phrase",
                definition: "编程时的氛围或状态，沉浸式编程体验",
                sentence_en: "I'm in a great <b>vibe coding</b> mood tonight!",
                sentence_cn: "今晚我处于超棒的编程氛围中！",
                memory_hook: "Vibe (氛围) + Coding (编程)，描述编程时的专注和舒适状态。",
                color: "#fd79a8"
            }
EOF
)

# 读取模板文件
TEMPLATE_FILE="/Users/huyg-macmini/.openclaw/media/inbound/file_2---a5894035-307c-4565-a0e5-d2600648ebcf"

# 创建临时文件
cat > /tmp/english_vocabulary.html << 'EOF'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daily Zen Vocabulary</title>
    <style>
        /* --- 样式区域 (无需修改) --- */
        :root {
            --bg-color: #f0f2f5;
            --card-bg: #ffffff;
            --text-main: #2d3436;
            --text-sub: #636e72;
            --shadow: 0 10px 20px rgba(0,0,0,0.08);
        }
        body {
            font-family: 'Segoe UI', 'Roboto', sans-serif;
            background-color: var(--bg-color);
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 40px 20px;
        }
        header { text-align: center; margin-bottom: 40px; }
        h1 { font-weight: 300; letter-spacing: 2px; margin-bottom: 10px; color: var(--text-main); }
        .date { color: var(--text-sub); font-size: 0.9rem; text-transform: uppercase; letter-spacing: 1px; }
        
        /* 网格布局 */
        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            max-width: 1200px;
            width: 100%;
        }

        /* 卡片 3D 结构 */
        .card-container {
            background-color: transparent;
            height: 400px;
            perspective: 1000px;
            cursor: pointer;
        }
        .card {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            transform-style: preserve-3d;
            border-radius: 20px;
            box-shadow: var(--shadow);
        }
        .card-container.flipped .card { transform: rotateY(180deg); }
        .front, .back {
            position: absolute;
            width: 100%;
            height: 100%;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            border-radius: 20px;
            background: var(--card-bg);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
        }
        
        /* 正面样式 */
        .front { border-bottom: 5px solid; }
        .word-tag { background: #dfe6e9; color: var(--text-sub); padding: 5px 12px; border-radius: 15px; font-size: 0.8rem; margin-bottom: 20px; font-weight: 600; }
        .word { font-size: 2.5rem; font-weight: 700; color: var(--text-main); margin: 0; }
        .phonetic { font-family: 'Arial Unicode MS', sans-serif; color: var(--text-sub); font-size: 1.2rem; margin-top: 10px; font-style: italic; }
        .hint-icon { margin-top: 40px; color: #b2bec3; font-size: 0.9rem; opacity: 0.7; }

        /* 背面样式 */
        .back { transform: rotateY(180deg); text-align: left; align-items: flex-start; padding: 30px; }
        .definition { font-size: 1.2rem; font-weight: bold; color: var(--text-main); margin-bottom: 15px; width: 100%; border-bottom: 1px solid #eee; padding-bottom: 10px; }
        .example-box { background: #f9f9f9; padding: 12px; border-radius: 8px; margin-bottom: 15px; width: 100%; }
        .en-sent { font-size: 0.95rem; color: #2d3436; margin-bottom: 5px; line-height: 1.4; }
        .cn-sent { font-size: 0.85rem; color: #636e72; }
        .memory-hook { font-size: 0.85rem; color: #e17055; background: #ffeaa740; padding: 8px; border-radius: 6px; width: 100%; }
        
        /* 播放按钮 */
        .audio-btn { position: absolute; top: 20px; right: 20px; background: none; border: none; cursor: pointer; font-size: 1.2rem; transition: transform 0.2s; }
        .audio-btn:hover { transform: scale(1.2); }
    </style>
</head>
<body>

    <header>
        <h1>Daily Vocabulary</h1>
        <div class="date" id="stats-line">Loading...</div>
    </header>

    <div class="container" id="card-area">
    </div>

    <script>
        // ==========================================
        // 🟢 数据配置区域 (START) 🟢
        // 警告：不要删除 const words = [ 这一行！
        // ==========================================
        const words = [
EOF

# 添加words数组内容
echo "$WORDS_CONTENT" >> /tmp/english_vocabulary.html

# 添加剩余的HTML内容
cat >> /tmp/english_vocabulary.html << 'EOF'
        ];
        // ==========================================
        // 🔴 逻辑区域 (End of Data) 🔴
        // ==========================================

        function renderCards() {
            const container = document.getElementById('card-area');
            const stats = document.getElementById('stats-line');
            
            if (typeof words === 'undefined' || !words) {
                stats.innerText = "Error: Words data is missing!";
                return;
            }

            stats.innerText = `Focus & Learn • ${words.length} New Words`;
            container.innerHTML = '';

            words.forEach((item) => {
                const cardHTML = `
                <div class="card-container" onclick="this.classList.toggle('flipped')">
                    <div class="card">
                        <div class="front" style="border-bottom-color: ${item.color || '#333'}">
                            <button class="audio-btn" onclick="playAudio(event, '${item.word}')">🔊</button>
                            <span class="word-tag">${item.type}</span>
                            <h2 class="word">${item.word}</h2>
                            <div class="phonetic">${item.phonetic}</div>
                            <div class="hint-icon">👆 Tap to flip</div>
                        </div>
                        <div class="back">
                            <div class="definition">${item.definition}</div>
                            <div class="example-box">
                                <div class="en-sent">${item.sentence_en}</div>
                                <div class="cn-sent">${item.sentence_cn}</div>
                            </div>
                            <div class="memory-hook">
                                💡 <b>记忆技巧：</b><br>${item.memory_hook}
                            </div>
                        </div>
                    </div>
                </div>`;
                container.innerHTML += cardHTML;
            });
        }

        function playAudio(event, text) {
            event.stopPropagation();
            if ('speechSynthesis' in window) {
                const utterance = new SpeechSynthesisUtterance(text);
                utterance.lang = 'en-US';
                utterance.rate = 0.9;
                window.speechSynthesis.speak(utterance);
            }
        }

        renderCards();
    </script>
</body>
</html>
EOF

# 复制到iCloud Drive
cp /tmp/english_vocabulary.html ~/Library/Mobile\ Documents/com\~apple\~cloudDocs/macmini/
echo "英语词汇网页已更新到iCloud Drive"

# 清理临时文件
rm /tmp/english_vocabulary.html