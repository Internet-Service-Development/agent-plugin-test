# 圖示使用指南

> **文件資訊**  
> 原檔名：`icon-usage-guidelines_v8.md`  
> 更新日期：2026-03-25
> **文件資訊**  
> 原檔名：`icon-usage-guidelines_v8.md`  
> 更新日期：2026-03-27

## 概述

本文件概述了在專案中使用圖示的強制性標準和最佳實踐。所有圖示使用都必須遵循這些指南，以保持一致性並避免依賴衝突。

此外，早期某些專案可能仍使用外部第三方套件的圖示，因此本文件的另一個目的，是指導如何將這些第三方 icons 正確替換為 `@eysoos/icons`。

## 圖示使用指南

1. **優先圖示來源**：優先使用 `@eysoos/icons` 函式庫作為圖示來源
2. **建議替換**：若專案已使用 Material-UI、React Icons 函式庫（包括 `react-icons/fa`、`react-icons/fi` 等）、Font Awesome CDN 等第三方圖示，建議逐步替換為 `@eysoos/icons`
3. **匯入模式**：始終使用具名匯入來匯入圖示
4. **圖示替換策略**：當從其他函式庫替換圖示時，如果在 `@eysoos/icons` 中不存在完全匹配的名稱，請從 `@eysoos/icons` 中選擇任何可用的圖示，而不是創建新的或引用不存在的圖示
5. **缺失圖示處理**：如果 `@eysoos/icons` 中不存在所需圖示，使用一個相同大小的 `<div></div>` 佔位，或選擇功能相近的現有圖示

## 圖示替換指南

從其他圖示函式庫遷移到 `@eysoos/icons` 時，請遵循以下步驟：

1. **第一優先級**：在 `@eysoos/icons` 中尋找完全匹配的名稱
2. **第二優先級**：如果沒有完全匹配，找到一個具有相同功能目的的圖示
3. **第三優先級**：如果在 `@eysoos/icons` 中找不到相應名稱的圖示，就不要放 icon，補一個一模一樣大的 `<div></div>` 進去
4. **關鍵規則**：永遠不要引用 `@eysoos/icons` 中不存在的圖示

### React Icons 替換對照與智能規則

以下是常見的 `react-icons/fa` 圖示與 `@eysoos/icons` 的對應替換：

```javascript
// ❌ import { FaEdit } from 'react-icons/fa';
// ✅ import { EditIcon } from '@eysoos/icons';

// ❌ import { FaSearch } from 'react-icons/fa';
// ✅ import { SearchIcon } from '@eysoos/icons';

// ❌ import { FaFileImage } from 'react-icons/fa';
// ✅ import { ImageIcon } from '@eysoos/icons';
```

#### 更多常見替換範例

```javascript
// 檔案操作相關
// ❌ import { FaFile } from 'react-icons/fa';
// ✅ 如果 FileIcon 存在則使用，否則使用 <div></div> 佔位

// ❌ import { FaFolder } from 'react-icons/fa';
// ✅ 如果 FolderIcon 存在則使用，否則使用相近功能圖示

// ❌ import { FaDownload } from 'react-icons/fa';
// ✅ import { DownloadIcon } from '@eysoos/icons';

// ❌ import { FaUpload } from 'react-icons/fa';
// ✅ import { UploadIcon } from '@eysoos/icons';

// 導航相關
// ❌ import { FaHome } from 'react-icons/fa';
// ✅ 如果 HomeIcon 存在則使用，否則使用相近功能圖示

// ❌ import { FaArrowLeft } from 'react-icons/fa';
// ✅ import { BackIcon } from '@eysoos/icons';

// ❌ import { FaArrowRight } from 'react-icons/fa';
// ✅ import { NextIcon } from '@eysoos/icons';

// ❌ import { FaTimes } from 'react-icons/fa';
// ✅ import { CloseIcon } from '@eysoos/icons';

// 操作相關
// ❌ import { FaPlus } from 'react-icons/fa';
// ✅ import { AddIcon } from '@eysoos/icons';

// ❌ import { FaTrash } from 'react-icons/fa';
// ✅ import { DeleteIcon } from '@eysoos/icons';

// ❌ import { FaSave } from 'react-icons/fa';
// ✅ import { SaveIcon } from '@eysoos/icons';

// ❌ import { FaCopy } from 'react-icons/fa';
// ✅ import { CopyIcon } from '@eysoos/icons';

// 系統相關
// ❌ import { FaCog } from 'react-icons/fa';
// ✅ import { SettingIcon } from '@eysoos/icons';

// ❌ import { FaUser } from 'react-icons/fa';
// ✅ 如果 AccountIcon 存在則使用，否則使用相近功能圖示

// ❌ import { FaLock } from 'react-icons/fa';
// ✅ import { LockIcon } from '@eysoos/icons';

// ❌ import { FaBell } from 'react-icons/fa';
// ✅ import { NoticeIcon } from '@eysoos/icons';

// 命名中包含 "calendar" 的圖示都可以替換為 CalendarIcon
// ❌ import { BsCalendar2Week } from 'react-icons/bs';
// ✅ import { CalendarIcon } from '@eysoos/icons';
// 理由：BsCalendar2Week 中的 "Calendar" 關鍵字對應 CalendarIcon

// ❌ import { FaCalendarAlt } from 'react-icons/fa';
// ✅ import { CalendarIcon } from '@eysoos/icons';
// 理由：FaCalendarAlt 中的 "Calendar" 關鍵字對應 CalendarIcon

// 左箭頭 -> BackIcon
// ❌ import { FaAngleLeft } from 'react-icons/fa';
// ✅ import { BackIcon } from '@eysoos/icons';
// 理由：FaAngleLeft 表示向左的箭頭，功能上等同於 "上一個" 的概念

// ❌ import { IoChevronBack } from 'react-icons/io5';
// ✅ import { BackIcon } from '@eysoos/icons';
// 理由：ChevronBack 表示返回/向左，功能上等同於 BackIcon

// 下箭頭 -> AccordionArrowDownIcon
// ❌ import { FaAngleDown } from 'react-icons/fa';
// ✅ import { AccordionArrowDownIcon } from '@eysoos/icons';
// 理由：FaAngleDown 表示向下展開，常用於手風琴組件的展開/收合功能

// ❌ import { IoChevronDown } from 'react-icons/io5';
// ✅ import { AccordionArrowDownIcon } from '@eysoos/icons';
// 理由：ChevronDown 表示向下展開，功能上等同於手風琴的箭頭

// 搜尋相關 - 包含 "search" 關鍵字
// ❌ import { FaSearchPlus } from 'react-icons/fa';
// ✅ import { SearchIcon } from '@eysoos/icons';

// 編輯相關 - 包含 "edit" 或 "pencil" 關鍵字
// ❌ import { FaPencilAlt } from 'react-icons/fa';
// ✅ import { EditIcon } from '@eysoos/icons';

// 刪除相關 - 包含 "trash", "delete", "remove" 關鍵字
// ❌ import { FaTrashAlt } from 'react-icons/fa';
// ✅ import { DeleteIcon } from '@eysoos/icons';

// 關閉相關 - 包含 "close", "times", "x" 關鍵字
// ❌ import { FaTimesCircle } from 'react-icons/fa';
// ✅ import { CloseIcon } from '@eysoos/icons';

// 設定相關 - 包含 "setting", "cog", "gear" 關鍵字
// ❌ import { FaCogs } from 'react-icons/fa';
// ✅ import { SettingIcon } from '@eysoos/icons';

// 語言/國際化相關 - 包含 "globe", "world", "language" 關鍵字
// ❌ import { FaGlobe } from 'react-icons/fa';
// ✅ import { LanguageIcon } from '@eysoos/icons';
// 理由：FaGlobe（地球儀）通常用於表示語言選擇或國際化功能

// 復原/重做相關
// ❌ import { FaUndo, FaRedo } from 'react-icons/fa';
// ✅ import { UndoIcon, RedoIcon } from '@eysoos/icons';
```

### 範例：DragIndicator 圖示替換

```javascript
// 使用 Material-UI 的原始程式碼
import DragIndicatorIcon from '@mui/icons-material/DragIndicator';

// ❌ 錯誤 - 這個確切名稱在 @eysoos/icons 中不存在
import { DragIndicatorIcon } from '@eysoos/icons';

// ✅ 正確 - 使用上下文適當的圖示
import { DndIcon } from '@eysoos/icons';

// 使用上下文：允許拖拽功能的元件
const DraggableItem = () => {
  return (
    <div className="draggable-item">
      <DndIcon /> {/* 表示拖放功能 */}
      <span>拖拽我來重新排序</span>
    </div>
  );
};
```

### 常見替換模式

| 原始函式庫          | 原始圖示          | 建議解決方案       | 理由                |
| ------------------- | ----------------- | ------------------ | ------------------- |
| @mui/icons-material | DragIndicatorIcon | DndIcon            | 拖放功能            |
| @mui/icons-material | MoreVertIcon      | MoreStraightIcon | 垂直選單選項        |
| @mui/icons-material | MoreHorizIcon     | MoreHorizontalIcon | 水平選單選項        |
| react-icons         | FaUser            | AccountIcon        | 使用者個人資料/帳戶 |
| react-icons         | FaCog             | SettingIcon        | 設定/配置           |
| react-icons         | FaGlobe           | LanguageIcon       | 語言選擇/國際化     |
| react-icons         | FaUndo            | UndoIcon           | 復原                |
| react-icons         | FaRedo            | RedoIcon           | 重做                |
| react-icons         | FaTiktok          | TikTokIcon         | TikTok 社交媒體     |
| react-icons         | FaTwitch          | TwitchIcon         | Twitch 直播平台     |
| react-icons         | FaInstagram       | InstagramIcon      | Instagram 社交媒體  |
| react-icons         | FaTwitter         | TwitterIcon        | Twitter/X 社交媒體  |
| react-icons         | FaLinkedin        | LinkedInIcon       | LinkedIn 職業社交   |
| react-icons         | FaYoutube         | YoutubeIcon        | YouTube 影音平台    |
| react-icons         | FaGoogle          | GoogleIcon         | Google 服務         |
| react-icons         | FaFacebook        | FbIcon             | Facebook 社交媒體   |
| react-icons         | FaCrop            | CropIcon           | 裁剪功能            |
| react-icons         | FaCompress        | CollapseIcon       | 收合                |
| react-icons         | FaExpand          | ExpandIcon         | 展開                |
| react-icons         | FaMinus           | MinusIcon          | 減少                |
| react-icons         | FaThumbtack       | PinIcon            | 釘選                |
| react-icons         | FaRotate          | RotateIcon         | 旋轉                |
| react-icons         | FaHeart           | LikeIcon           | 按讚                |
| react-icons         | FaStar            | StarSolidIcon      | 星星收藏            |
| react-icons         | FaLink            | LinkIcon           | 連結                |
| react-icons         | FaTag             | TagIcon            | 標籤                |
| react-icons         | FaShare           | ShareIcon          | 分享                |
| react-icons         | FaPlay            | PlayVideoIcon      | 播放影片            |
| @mui/icons-material | SwapHoriz         | SwapIcon           | 交換/互換           |
| @mui/icons-material | Brush             | BrushIcon          | 畫筆                |
| @mui/icons-material | TextFields        | TextIcon           | 文字                |
| @mui/icons-material | FormatAlignLeft   | AlignLeftIcon      | 文字置左            |
| @mui/icons-material | FormatAlignCenter | AlignCenterIcon    | 文字置中            |
| @mui/icons-material | FormatAlignRight  | AlignRightIcon     | 文字置右            |

### 缺失圖示處理範例

```javascript
// ❌ 禁止 - 不可再使用 react-icons/fa
import { FaGlobe } from 'react-icons/fa';
import { FaPhone } from 'react-icons/fa';

// ❌ 錯誤 - 不要引用不存在的圖示
import { GlobalIcon } from '@eysoos/icons'; // GlobalIcon 不存在
import { PhoneIcon } from '@eysoos/icons'; // PhoneIcon 不存在

// ✅ 正確 - 使用 @eysoos/icons 中存在的對應圖示
import { LanguageIcon, EmailCopilotIcon, HandIcon } from '@eysoos/icons';

// ✅ 正確 - 智能替換範例
const ContactInfo = () => {
  return (
    <div>
      {/* FaGlobe 替換為 LanguageIcon（地球儀通常表示語言/國際化功能） */}
      <LanguageIcon /> 選擇語言
      {/* 使用現有的相近圖示 */}
      <EmailCopilotIcon /> contact@example.com
      {/* 如果沒有合適的圖示，使用佔位 div */}
      <div
        style={{ width: '16px', height: '16px', display: 'inline-block' }}
      ></div>
      +1234567890
      {/* 或者選擇功能相近的現有圖示 */}
      <HandIcon /> 聯絡我們
    </div>
  );
};

// ❌ 錯誤 - 不要假設圖示在 @eysoos/icons 中存在
import { EmailIcon, PhoneIcon, HandIcon } from '@eysoos/icons';
```

## 圖示匯入範例

```javascript
// ✅ 正確 - 從 @eysoos/icons 具名匯入（唯一允許的方式）
import { MenuCloseIcon, MenuOpenIcon } from '@eysoos/icons';
import { SearchIcon, EditIcon, DeleteIcon } from '@eysoos/icons';
import { AddIcon, CancelIcon, SaveIcon } from '@eysoos/icons';

// ❌ 禁止 - 所有其他圖示函式庫（包括 react-icons/fa）
import { FaGlobe, FaPhone } from 'react-icons/fa'; // ❌ 現在禁止
import MenuIcon from '@mui/icons-material/Menu'; // ❌ 禁止
import { FiSearch } from 'react-icons/fi'; // ❌ 禁止
import { Icon } from '@iconify/react'; // ❌ 禁止

// ❌ 嚴重錯誤 - 不要引用不存在的圖示
import { GlobalIcon, PhoneIcon } from '@eysoos/icons'; // ❌ 這些不存在
```

## 圖示使用範例

```javascript
// 基本使用
import React from 'react';
import { SearchIcon, FilterIcon, MoreHorizontalIcon } from '@eysoos/icons';

const SearchBar = () => {
  return (
    <div className="search-bar">
      <SearchIcon />
      <input placeholder="搜尋..." />
      <FilterIcon />
      <MoreHorizontalIcon />
    </div>
  );
};

// 帶樣式
import { Button } from '@eysoos/prisma';
import { AddIcon, EditIcon } from '@eysoos/icons';

const ActionButtons = () => {
  return (
    <div>
      <Button variant="contained">
        <AddIcon />
        新增項目
      </Button>
      <Button variant="outlined">
        <EditIcon />
        編輯
      </Button>
    </div>
  );
};

// 條件圖示渲染
import { MenuOpenIcon, MenuCloseIcon } from '@eysoos/icons';

const MenuToggle = ({ isOpen }) => {
  return <button>{isOpen ? <MenuCloseIcon /> : <MenuOpenIcon />}</button>;
};
```

## 可用圖示類別

- **導航**：MenuOpenIcon, MenuCloseIcon, NextIcon, BackIcon, CloseIcon, CollapseIcon, ExpandIcon
- **操作**：AddIcon, EditIcon, DeleteIcon, SaveIcon, CancelIcon, CopyIcon, UndoIcon, RedoIcon, CropIcon, SwapIcon, RotateIcon, ResizeIcon, DndIcon, MinusIcon, PinIcon, PinDisableIcon
- **內容**：SearchIcon, FilterIcon, SortIcon, UploadIcon, DownloadIcon, BigUploadIcon, BigAddIcon, BigFileIcon, AllFilesIcon, ImageLargeIcon, NoResultIcon
- **狀態**：SuccessIcon, WarningIcon, WarningLargeIcon, LoadingIcon, CompletedIcon, ConnectedIcon, AreAddedIcon, NotAddedIcon
- **社交**：FbIcon, FacebookColorIcon, TwitterIcon, TwitterColorIcon, LinkedInIcon, LinkedInColorIcon, YoutubeIcon, YoutubeColorIcon, InstagramIcon, TikTokIcon, TikTokDarkColorIcon, TikTokLightColorIcon, TwitchIcon, GoogleIcon, GoogleColorIcon
- **檔案**：PdfIcon, ExcelFileIcon, WordFileIcon, ImageIcon, CsvIcon, BigAiNoteIcon
- **系統**：SettingIcon, HelpIcon, NoticeIcon, PermissionIcon, LockIcon, DashboardIcon, DashboardBannerIcon
- **業務**：CommercialIcon, ProArtIcon, AiotIcon, HealthCareIcon, FAQLibraryIcon, NDAPlatformIcon, NPLDashboardIcon, MarketplaceIcon, ProjectIcon, NewProductIcon, MySpaceIcon, RankingIcon, Top3Icon, SocialPostIcon, PresentationIcon
- **AI 相關**：AIEditIcon, AINormalIcon, GradientAINormalIcon, GradientAISearchIcon, DetectAIIcon, ExpandAIIcon, InpaintingAIIcon, RecolorAIIcon, RemoveAIIcon, WallpaperAIIcon
- **圖像編輯**：BrushIcon, DropperIcon, CircleIcon, TriangleIcon, TextIcon, GroupIcon, UnGroupIcon, FlipHorizontalIcon, FlipVerticalIcon, RadiusIcon, RadiusCornerTopLeftIcon, RadiusCornerTopRightIcon, RadiusCornerBottomLeftIcon, RadiusCornerBottomRightIcon, ShadowIcon, StyleTemplateIcon, AddCanvasIcon
- **圖片比例**：ImageRatio11Icon, ImageRatio12Icon, ImageRatio21Icon, ImageRatio23Icon, ImageRatio32Icon, ImageRatio34Icon, ImageRatio43Icon, ImageRatio45Icon, ImageRatio54Icon, ImageRatio169Icon, ImageRatio219Icon, ImageRatio916Icon
- **文字排版**：AlignLeftIcon, AlignCenterIcon, AlignRightIcon, TextCaseNormalIcon, TextCaseUppercaseIcon
- **互動**：LikeIcon, LikeHoverIcon, LikePressIcon, StarSolidIcon, StarHoverIcon, PlayVideoIcon, CallInIcon
- **分享與協作**：ShareIcon, Share_2_Icon, Share_3_Icon, SharedFromOtherIcon, SmallSharedFromOtherIcon, SmallNoteTitleShareIcon, SmallNoteTitleSharedFromOtherIcon, LinkIcon
- **Solid 圖示**：SolidAiContentFactoryIcon, SolidAiHubMiniIcon, SolidAiImageStudioIcon, SolidAiSeoAnalystIcon, SolidBuBiAgentIcon, SolidFAQLibraryIcon, SolidGenImageIcon, SolidGenPodcastIcon, SolidGenTextIcon, SolidGenVideoIcon, SolidNDAPlatformIcon, SolidNPLDashboardIcon, SolidSocialPostsStudioIcon, SolidTagIcon, TagIcon, NdaAreSetIcon
- **其他（完整清單）**：AboutAsusIcon, AlignCenterIcon, AlignLeftIcon, AlignRightIcon, TextCaseUppercaseIcon, TextCaseNormalIcon, ResizeIcon, InpaintingAIIcon, DetectAIIcon, RecolorAIIcon, ExpandAIIcon, RemoveAIIcon, RadiusIcon, BrushIcon, FlipVerticalIcon, FlipHorizontalIcon, CircleIcon, AIEditIcon, WallpaperAIIcon, UnGroupIcon, GroupIcon, TextIcon, RadiusCornerBottomRightIcon, RadiusCornerTopRightIcon, RadiusCornerBottomLeftIcon, RadiusCornerTopLeftIcon, TriangleIcon, StyleTemplateIcon, AddCanvasIcon, ImageRatio11Icon, ImageRatio32Icon, ImageRatio43Icon, ImageRatio54Icon, ImageRatio169Icon, ImageRatio219Icon, ImageRatio23Icon, ImageRatio34Icon, ImageRatio45Icon, ImageRatio916Icon, ImageRatio21Icon, ImageRatio12Icon, AddAssistantIcon, AccordionArrowDownIcon, AccordionArrowUpIcon, AccountIcon, AccountMediumIcon, AccountMiddlewareIcon, ActivesIcon, AddDocIcon, AddedDocIcon, AddFolderIcon, AddIcon, AiAssistantIcon, AiIcon, AINormalIcon, AiNoteIcon, AiotIcon, AllFilesIcon, AnalyzingDataIcon, AreAddedIcon, AssistantIcon, AsusIcon, AthenaIcon, AttachmentIcon, AuthorListIcon, AutoSyncIcon, BannerIcon, BasicIcon, BigAddIcon, BigAiNoteIcon, BigFileIcon, BigLockIcon, BigStarIcon, BigStarSolidIcon, BigUnlockIcon, BigUploadIcon, BisIcon, BlogIcon, BookedOnlineIcon, BrainHubIcon, BreadcrumbSeparatorIcon, BusinessPartnerIcon, BusinessResourceIcon, BusinessServiceIcon, BusinessSolutionIcon, CalendarIcon, CallInIcon, CancelIcon, CaseStudyIcon, ChannelSiteIcon, ChatsIcon, CheckboxCheckedIcon, CheckboxIndeterminateIcon, ClearInputIcon, CloseIcon, CodingForDevelopersIcon, CollapseLeftMobileIcon, CollapseRightMobileIcon, CollectionAddedIcon, CollectionIcon, CommercialIcon, CompareIcon, CompletedIcon, ContactUsIcon, ContentHomeIcon, ContentHubIcon, ContentIcon, CopyIcon, CountTimeIcon, CrawlIcon, CsvIcon, CropIcon, SwapIcon, ExpandIcon, CollapseIcon, ConnectedIcon, CollectionCancelIcon, DashboardBannerIcon, DashboardIcon, DataSyncDisconnectIcon, DataSyncIcon, DealsPageIcon, DeepResearchIcon, DefaultSystemIcon, DeleteIcon, DiscordIcon, DndIcon, DropperIcon, DocumentIcon, DownloadIcon, DuplicateIcon, EditIcon, EdmIcon, EmailCopilotIcon, EShopIcon, EventIcon, ExcelFileIcon, ExclamationMarkIcon, ExpiredItemIcon, ExploreAdvanceIcon, ExternalLinkIcon, EysoosUiIcon, FAQLibraryIcon, FbIcon, FeedbackIcon, FileIcon, FilterIcon, FormatIcon, GeneratingCampaignIdeasIcon, GenioDashboardIcon, GenioIcon, GoogleIcon, GradientAINormalIcon, GradientAISearchIcon, GridListIcon, HandIcon, HealthCareIcon, HelpIcon, HelpMeChooseIcon, HideIcon, ImageGenerationIcon, ImageIcon, ImageLargeIcon, InstagramIcon, IntroductionIcon, InvisibleIcon, JiraIcon, JoinTeamGroupIcon, LanguageIcon, LeaveIcon, LegalIcon, LevelIcon, Link_2_Icon, LinkedInIcon, LinkIcon, ListSortIcon, LoadingIcon, LockIcon, MailIcon, MdaIipIcon, MdaSpaceIcon, MediumAiHubIcon, MediumAiNoteIcon, MediumCrawlIcon, MediumPortalIcon, MenuCloseIcon, MenuIcon, MenuOpenIcon, MobileIcon, ModularizationIcon, ModuleIcon, MoreHorizontalIcon, MoreIcon, MoreStraightIcon, MoveIcon, MoveToIcon, MoveToTopIcon, MuteIcon, MinusIcon, MarketplaceIcon, MySpaceIcon, NdaAreSetIcon, NdaIcon, NDAPlatformIcon, NewChatIcon, NewChatLargeIcon, NewProductIcon, NewsIcon, NextIcon, NoResultIcon, NotAddedIcon, NoticeIcon, NPLDashboardIcon, OcmIcon, OptionEditorIcon, OrganizeIcon, OriginDataIcon, OutsourcingIcon, PcIcon, PdfIcon, PermissionAddIcon, PermissionIcon, PinterestIcon, PlayIcon, PnIcon, PowerPointFileIcon, PreviewIcon, LikeHoverIcon, YoutubeColorIcon, TikTokDarkColorIcon, LikePressIcon, TikTokIcon, LinkedInColorIcon, FacebookColorIcon, GoogleColorIcon, TwitterColorIcon, TikTokLightColorIcon, PlayVideoIcon, LikeIcon, BackIcon, StarHoverIcon, PrivacyPolicyIcon, ProArtIcon, ProArtProfessionIcon, ProductIcon, ProductLevelIcon, ProductRelatedIcon, ProjectIcon, PromotionAdsIcon, PromotionIcon, PromptIcon, ProsIcon, PublishIcon, PresentationIcon, PinIcon, PinDisableIcon, QRcodeIcon, RandomIcon, ReasoningIcon, RedmineIcon, RegionIcon, RemoveFavoriteIcon, ReportIssueIcon, ResetIcon, RotateIcon, RetailerIcon, RewardAsusIcon, RewardIcon, RogIcon, RedoIcon, RankingIcon, SaveIcon, SaveNoteIcon, SearchIcon, SectionIcon, SelectedIcon, SendIcon, SeoIcon, SettingIcon, Share_2_Icon, Share_3_Icon, ShareIcon, SharedFromOtherIcon, SharePointIcon, ShortSpecTemplateIcon, ShowIcon, ShadowIcon, SiteSearchIcon, SkuIcon, SmallCrawlIcon, SmallEventIcon, SmallPortalIcon, SmallProjectAddIcon, SmallProjectGroupIcon, SmallProjectIcon, SmallNoteTitleShareIcon, SmallPromotionAdsIcon, SmallNoteTitleSharedFromOtherIcon, SmallSharedFromOtherIcon, SmallPaymentIcon, SocialPostIcon, SolidAccountIcon, SolidAccountMiddlewareIcon, SolidAiAssistantServiceIcon, SolidAiContentFactoryIcon, SolidAiHubIcon, SolidAiHubMiniIcon, SolidAiImageStudioIcon, SolidAiNoteIcon, SolidAiPortalIcon, SolidAiSeoAnalystIcon, SolidBannerIcon, SolidBuBiAgentIcon, SolidChannelIcon, SolidContentHubIcon, SolidCrawlIcon, SolidDefaultSystemIcon, SolidEdmIcon, SolidEmptyAppIcon, SolidEShopBiAgentIcon, SolidEventIcon, SolidEysoosUiIcon, SolidFAQLibraryIcon, SolidGenImageIcon, SolidGenPodcastIcon, SolidGenTextIcon, SolidGenVideoIcon, SolidJiraIcon, SolidLegalIcon, SolidMdaIcon, SolidModularizationIcon, SolidNDAPlatformIcon, SolidNPLDashboardIcon, SolidOcmIcon, SolidPromotionAdsIcon, SolidQRcodeIcon, SolidRedmineIcon, SolidRetailerIcon, SolidRewardAsusIcon, SolidRewardIcon, SolidSearchPnIcon, SolidSocialPostsStudioIcon, SolidSpecIcon, SolidSrtIcon, SolidTagIcon, SolidTranslationCopilotIcon, SortIcon, SpacePaperIcon, SpecEditorIcon, SpecIcon, SpecTemplateIcon, SRTIcon, StarIcon, StarSolidIcon, StopIcon, StorePageIcon, StudyGuideIcon, SubscribeIcon, SuccessIcon, SupportIcon, SystemIcon, SystemProductIcon, TabIcon, TableSortDownIcon, TableSortIcon, TableSortUpIcon, TabletIcon, TagIcon, TaskIcon, TimelineIcon, ToastErrorIcon, ToastInfoIcon, ToastSuccessIcon, ToastWarningIcon, ToolMenuMobileIcon, TranslatedSourceIcon, TranslatingTextIcon, TranslationCopilotIcon, TranslationIcon, TutorialsIcon, TwitchIcon, TwitterIcon, TxtFileIcon, Top3Icon, UnlockIcon, UploadIcon, UrgentIcon, UndoIcon, VersionIcon, VideoGenerationIcon, ViewListIcon, VisibleIcon, VolumeIcon, WallpapersIcon, WarningIcon, WarningLargeIcon, WebsiteIcon, WebsiteSpaceIcon, WordFileIcon, YoutubeIcon

## 圖示樣式指南

### 基本樣式應用

```javascript
// 使用 CSS 類別應用樣式
<SearchIcon className="search-icon" />

// 或在必要時使用內聯樣式
<EditIcon style={{ fontSize: '20px', color: '#1389fc' }} />

// 使用 CSS 模組
import styles from './Component.module.css';
<DeleteIcon className={styles.deleteIcon} />
```

### 圖示樣式限制處理

某些 `@eysoos/icons` 圖示可能不支援直接設定 `width`、`height` 或 `style` 屬性。在這種情況下，請使用 `div` 包裝器來應用樣式：

```javascript
// ❌ 如果圖示不支援直接樣式設定
// 注意：SomeIcon 僅為示意用名稱，請替換為實際存在的 @eysoos/icons 圖示
<SomeIcon width={24} height={24} style={{ color: 'red' }} />

// ✅ 使用 div 包裝器來應用樣式
<div
  style={{
    width: '24px',
    height: '24px',
    color: 'red',
    display: 'inline-flex',
    alignItems: 'center',
    justifyContent: 'center'
  }}
>
  <SomeIcon />
</div>

// ✅ 使用 CSS 類別的包裝器方式（SomeIcon 僅為示意用名稱）
<div className="icon-wrapper">
  <SomeIcon />
</div>
```

### 包裝器樣式範例

```css
/* CSS 檔案中定義包裝器樣式 */
.icon-wrapper {
  width: 24px;
  height: 24px;
  color: #1389fc;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

.large-icon-wrapper {
  width: 32px;
  height: 32px;
  color: #666;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}
```

### 實際使用範例

```javascript
import { SearchIcon, EditIcon, DeleteIcon } from '@eysoos/icons';

const IconExamples = () => {
  return (
    <div>
      {/* 直接樣式（如果圖示支援） */}
      <SearchIcon className="search-icon" />

      {/* 使用包裝器（當圖示不支援直接樣式時） */}
      <div style={{ width: '20px', height: '20px', color: 'blue' }}>
        <EditIcon />
      </div>

      {/* 使用 CSS 類別包裝器 */}
      <div className="icon-wrapper">
        <DeleteIcon />
      </div>

      {/* 複雜樣式的包裝器 */}
      <div
        style={{
          width: '28px',
          height: '28px',
          padding: '4px',
          borderRadius: '4px',
          backgroundColor: '#f0f0f0',
          display: 'inline-flex',
          alignItems: 'center',
          justifyContent: 'center',
        }}
      >
        <SearchIcon />
      </div>
    </div>
  );
};
```

## 最佳實踐

- 始終使用具名匯入以獲得更好的 tree-shaking
- 在整個應用程式中保持圖示使用的一致性
- 為其預期目的使用適當的圖示類別
- 盡可能通過 CSS 類別而不是內聯樣式來應用樣式
- 在需要時確保圖示具有適當的 ARIA 標籤以提供無障礙性
- **優先原則**：優先使用 `@eysoos/icons`，外部專案若已有第三方圖示套件，建議逐步遷移
- 當所需圖示不存在時，優先選擇功能相近的現有圖示，或使用佔位元素
- 建議逐步將 `react-icons` 等第三方圖示替換為 `@eysoos/icons`，以保持一致性
- **智能替換**：根據原圖示名稱中的關鍵字（如 calendar、search、edit 等）選擇對應的 `@eysoos/icons` 圖示
- **樣式限制處理**：當圖示不支援直接樣式設定時，使用 `div` 包裝器來應用 `width`、`height`、`style` 等屬性
- **包裝器最佳實踐**：包裝器應使用 `display: inline-flex` 和適當的對齊屬性以確保圖示正確顯示
