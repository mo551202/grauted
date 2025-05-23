-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23 مايو 2025 الساعة 14:01
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mo`
--

-- --------------------------------------------------------

--
-- بنية الجدول `awarenesssessions`
--

CREATE TABLE `awarenesssessions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `awarenesssessions`
--

INSERT INTO `awarenesssessions` (`id`, `title`, `date`, `location`) VALUES
(2, 'العناية بالطفل حديث الولادة', '2025-04-12', 'المركز الصحي - قاعة 2'),
(3, 'الرضاعة الطبيعية وأهميتها', '2025-04-19', 'المركز الصحي - قاعة 3'),
(4, 'الاستعداد للولادة الطبيعية', '2025-04-25', 'مستشفى الأمومة - قاعة 1'),
(5, 'مخاطر التدخين على الحامل والجنين', '2025-05-02', 'المركز الصحي - قاعة 4'),
(6, 'كيفية التعامل مع الاكتئاب بعد الولادة', '2025-05-10', 'مستشفى الصحة النفسية - قاعة 2'),
(7, 'أهمية المتابعة الدورية أثناء الحمل', '2025-05-15', 'المركز الصحي - قاعة 5'),
(8, 'التمارين الرياضية المناسبة للحوامل', '2025-05-20', 'نادي الأم والطفل - القاعة الكبرى'),
(9, 'الإسعافات الأولية للرضع', '2025-05-25', 'الهلال الأحمر - قاعة التدريب'),
(10, 'اللقاحات الأساسية للمواليد الجدد', '2025-05-30', 'مستشفى الأطفال - قاعة 3');

-- --------------------------------------------------------

--
-- بنية الجدول `centernmae`
--

CREATE TABLE `centernmae` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `citycenter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `centernmae`
--

INSERT INTO `centernmae` (`id`, `name`, `citycenter`) VALUES
(1, 'اعزاز', 2),
(2, 'سجو', 2),
(3, 'الدانا', 1),
(4, 'عرابي', 2),
(5, 'سفر', 2);

-- --------------------------------------------------------

--
-- بنية الجدول `cityname`
--

CREATE TABLE `cityname` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `cityname`
--

INSERT INTO `cityname` (`id`, `name`) VALUES
(1, 'ادلب'),
(4, 'اللاذقية'),
(2, 'حلب'),
(5, 'طرطوس');

-- --------------------------------------------------------

--
-- بنية الجدول `emp`
--

CREATE TABLE `emp` (
  `id` int(11) NOT NULL,
  `num` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `emp`
--

INSERT INTO `emp` (`id`, `num`, `name`) VALUES
(1, '5512022299', 'AboAbdo'),
(2, '202', 'Moner'),
(3, '551', 'omar alsatouf');

-- --------------------------------------------------------

--
-- بنية الجدول `familyplanningarticle`
--

CREATE TABLE `familyplanningarticle` (
  `id` int(11) NOT NULL,
  `namearticle` varchar(255) NOT NULL,
  `timearticle` date NOT NULL,
  `textarticle` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `familyplanningarticle`
--

INSERT INTO `familyplanningarticle` (`id`, `namearticle`, `timearticle`, `textarticle`) VALUES
(1, 'ناجحون في تنظيم اسرتنا', '2025-03-22', 'الصحة النفسية أو الصحة العقلية هي مستوى الرفاهية النفسية أو العقل الخالي من الاضطرابات، \"وهي الحالة النفسية للشخص الذي يتمتع بمستوى عاطفي وسلوكي جيد\". من وجهة نظر علم النفس الإيجابي أو النظرة الكلية للصحة العقلية من الممكن أن تتضمن قدرة الفرد على الاستمتاع بالحياة وخلق التوازن بين أنشطة الحياة ومتطلباتها لتحقيق المرونة النفسية.\"\n\nالصحة النفسية وفقاً لمنظمة الصحة العالمية تعني الحياة التي تتضمن الرفاهية والاستقلال والجدارة والكفاءة الذاتية بين الأجيال وإمكانات الفرد الفكرية والعاطفية. كما أن منظمة الصحة العالمية نصت على أن رفاهية الفرد تشمل القدرة على إدراك قدراتهم والتعامل مع ضغوط الحياة العادية والإنتاج ومساعدة المجتمع. ومع ذلك فإن تعريف \"الصحة العقلية\" تختلف نتيجةََ للاختلاف الثقافي والتقييم الذاتي والتنافس في النظريات\". الصحة السلوكية هي المصطلح الأمثل للصحة العقلية. وهي تعتبر حالة من العافية يستطيع فيها كل فرد إدراك إمكاناته الخاصة والتكيّف مع حالات التوتّر العادية والعمل بشكل منتج ومفيد والإسهام في مجتمعه المحلي. والصحة هي حالة من اكتمال السلامة بدنياً وعقلياً واجتماعياً، لا مجرّد انعدام المرض.\n\nالشخص الذي يعاني من اضطراب في حالته الصحية السلوكية يواجه مشاكل عديدة، لعل أبرزها الإجهاد والاكتئاب والقلق ومشاكل في علاقاته مع الآخرين وقد يعاني من الحزن والإدمان وقصور الانتباه وفرط الحركة وصعوبات في التعلم واضطراب المزاج واضطرابات نفسية أخرى. يمكن للمرشدين النفسيين والمعالجين ومدربي الحياة وعلماء النفس ومزاولي مهنة التمريض والأطباء أن يساعدوا في إدارة المخاوف الصحية السلوكية عن طريق معالجتها بطرق مثل جلسات العلاج أو الاستشارة أو المداواة الميدان الجديد للصحة النفسية العالمية هو «مجال الدراسة والبحث والخبرة والذي يضع الأولوية لتحسين الصحة العقلية وتحقيق الإنصاف في مجال الصحة العقلية لجميع الناس في العالم»'),
(2, 'ثائرة في ظلام التنظيم ', '2025-03-26', 'مرحبا واهلا بكم في رمضان مبارك وشكرا لكم وألف تحية'),
(3, 'تقنيات التلقيح بالمساعدة', '2025-03-21', 'يمكنُ للمرأة التي لا تستطيع لأيّ سببٍ من الأسباب الإنجاب بالطّرق الطبيعية، أن تسعى للحصول على المساعدة، إذ تسعى بعض العائلات أو النساء للحصول على مساعدة من خلال تأجير الأرحام، حيث توافق المرأة على حمل وإنجاب طفل لزوجين أو شخص آخر.\r\n\r\nيوجد هناك نوعان من تأجير الأرحام: التقليدية والرحمية. تستخدم في الطرق التقليدية الحامل البديلة بيوضها وتحمل الطفل للزوج المقصود. يتم هذا الإجراء في عيادة الطبيب من خلال التلقيح داخل الرحم (IUI). وضوحًا، يحمل هذا النمط من الحمل صلة وراثة بين الحامل البديلة والطفل.\r\n\r\nيتعيّن قانونيًا على الحامل البديلة التّنازل عن أي مصلحة بالطفل بهدف إتمام انتقاله إلى الأبوين المقصودين.يحدث تأجير الأرحام عندما يتم إخصاب بويضة الأم أو البويضة المتبرع بها، خارج الجسم ومن ثم نقل البيضة الملقحة إلى الرحم البديل. غالبًا ما يشار إلى المرأة التي تحمل الطّفل على أنّها الحامل للحمل-gestational carrier. تكون الخطوات القانونيّة عادةً لتأكيد أبويّة الزّوج المراد أسهل من الطّريقة التّقليدية بسبب عدم وجود صلة وراثية بين الطفل والحامل.\r\n\r\nيعدّ التّبرع بالحيوانات المنويّة شكلًا آخر من أشكال المساعدة، ويقتضي الإجراء تخصيب الحيوانات المنويّة لبويضات المرأة عن طريق التّلقيح الصّناعيّ (إما عن طريق التلقيح داخل عنق الرحم أو التلقيح في الرحم) وبشكل أقل شيوعًا عن طريق التلقيح الاصطناعي (IVF)، ولكن يمكن أيضًا تحقيق التلقيح عن طريق ممارسة المتبرع الجنس مع امرأة بغرض إتمام الحمل. تعرف هذه الطريقة باسم التلقيح الطبيعي (NI).');

-- --------------------------------------------------------

--
-- بنية الجدول `mother`
--

CREATE TABLE `mother` (
  `id` int(11) NOT NULL,
  `num` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `mother`
--

INSERT INTO `mother` (`id`, `num`, `name`, `isAdmin`) VALUES
(1, '5512022299', 'فاطمة الشمالي', 0),
(2, '565626', 'خديجة حشاش', 1),
(4, '556202', 'عبدالسلام منير', 1),
(5, '09888', 'تسنيم عرابي', 0),
(6, '336622', 'abo aml', 0),
(23, '899', 'mmk', 0),
(24, '11111', 'orab', 0),
(26, '09887', 'oraby', 0),
(27, '098989', 'حميدة العيد', 0),
(28, '2020', 'حميدة', 0),
(30, '4455', 'halime', 0),
(35, '0988916951', 'حليمة الغافري', 0),
(38, '5656266', '666', 0),
(39, '202551', 'عائشة الدرويش', 0),
(40, '55555', '98988', 0),
(42, '123456', 'دلندح', 1),
(43, '12345', '55', 0);

-- --------------------------------------------------------

--
-- بنية الجدول `mothervaccines`
--

CREATE TABLE `mothervaccines` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nextDate` date NOT NULL,
  `lastDate` date NOT NULL,
  `momid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `mothervaccines`
--

INSERT INTO `mothervaccines` (`id`, `name`, `nextDate`, `lastDate`, `momid`) VALUES
(2, 'لقاح الكزاز (TT)', '2025-05-01', '2025-05-22', 1),
(3, 'لقاح الحصبة الألمانية', '2025-05-29', '2025-06-18', 2),
(4, 'لقاح الحصبة الألمانية', '2025-05-25', '2025-05-20', 5),
(5, 'لقاح الكزاز (TT)', '2025-05-10', '2025-03-10', 1),
(6, 'لقاح الحصبة الألمانية', '2025-04-05', '2025-02-05', 1),
(7, 'لقاح التهاب الكبد B', '2025-06-01', '2025-03-01', 2),
(8, 'لقاح الإنفلونزا الموسمية', '2025-10-15', '2025-01-15', 2),
(9, 'لقاح الكزاز (TT)', '2025-06-01', '2025-04-01', 4),
(10, 'لقاح الحصبة الألمانية', '2025-05-20', '2025-02-20', 4),
(11, 'لقاح الحصبة الألمانية', '2025-06-22', '2025-03-22', 5),
(12, 'لقاح الإنفلونزا الموسمية', '2025-11-10', '2025-01-10', 5);

-- --------------------------------------------------------

--
-- بنية الجدول `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `titel` varchar(250) NOT NULL,
  `content` varchar(255) NOT NULL,
  `usernote` int(11) NOT NULL,
  `imagenote` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `reproductivehealtharticle`
--

CREATE TABLE `reproductivehealtharticle` (
  `id` int(11) NOT NULL,
  `namearticle` varchar(255) NOT NULL,
  `textarticle` text NOT NULL,
  `dataarticle` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `reproductivehealtharticle`
--

INSERT INTO `reproductivehealtharticle` (`id`, `namearticle`, `textarticle`, `dataarticle`) VALUES
(1, 'الصحة الانجابية الخامسة عشر', 'الصحة النفسية أو الصحة العقلية هي مستوى الرفاهية النفسية أو العقل الخالي من الاضطرابات، \"وهي الحالة النفسية للشخص الذي يتمتع بمستوى عاطفي وسلوكي جيد\". من وجهة نظر علم النفس الإيجابي أو النظرة الكلية للصحة العقلية من الممكن أن تتضمن قدرة الفرد على الاستمتاع بالحياة وخلق التوازن بين أنشطة الحياة ومتطلباتها لتحقيق المرونة النفسية.\"\r\n\r\nالصحة النفسية وفقاً لمنظمة الصحة العالمية تعني الحياة التي تتضمن الرفاهية والاستقلال والجدارة والكفاءة الذاتية بين الأجيال وإمكانات الفرد الفكرية والعاطفية. كما أن منظمة الصحة العالمية نصت على أن رفاهية الفرد تشمل القدرة على إدراك قدراتهم والتعامل مع ضغوط الحياة العادية والإنتاج ومساعدة المجتمع. ومع ذلك فإن تعريف \"الصحة العقلية\" تختلف نتيجةََ للاختلاف الثقافي والتقييم الذاتي والتنافس في النظريات\". الصحة السلوكية هي المصطلح الأمثل للصحة العقلية. وهي تعتبر حالة من العافية يستطيع فيها كل فرد إدراك إمكاناته الخاصة والتكيّف مع حالات التوتّر العادية والعمل بشكل منتج ومفيد والإسهام في مجتمعه المحلي. والصحة هي حالة من اكتمال السلامة بدنياً وعقلياً واجتماعياً، لا مجرّد انعدام المرض.\r\n\r\nالشخص الذي يعاني من اضطراب في حالته الصحية السلوكية يواجه مشاكل عديدة، لعل أبرزها الإجهاد والاكتئاب والقلق ومشاكل في علاقاته مع الآخرين وقد يعاني من الحزن والإدمان وقصور الانتباه وفرط الحركة وصعوبات في التعلم واضطراب المزاج واضطرابات نفسية أخرى. يمكن للمرشدين النفسيين والمعالجين ومدربي الحياة وعلماء النفس ومزاولي مهنة التمريض والأطباء أن يساعدوا في إدارة المخاوف الصحية السلوكية عن طريق معالجتها بطرق مثل جلسات العلاج أو الاستشارة أو المداواة الميدان الجديد للصحة النفسية العالمية هو «مجال الدراسة والبحث والخبرة والذي يضع الأولوية لتحسين الصحة العقلية وتحقيق الإنصاف في مجال الصحة العقلية لجميع الناس في العالم»', '2025-03-01'),
(2, 'جائر في ظلام عادل ', 'الصحة النفسية أو الصحة العقلية هي مستوى الرفاهية النفسية أو العقل الخالي من الاضطرابات، \"وهي الحالة النفسية للشخص الذي يتمتع بمستوى عاطفي وسلوكي جيد\". من وجهة نظر علم النفس الإيجابي أو النظرة الكلية للصحة العقلية من الممكن أن تتضمن قدرة الفرد على الاستمتاع بالحياة وخلق التوازن بين أنشطة الحياة ومتطلباتها لتحقيق المرونة النفسية.\"\r\n\r\nالصحة النفسية وفقاً لمنظمة الصحة العالمية تعني الحياة التي تتضمن الرفاهية والاستقلال والجدارة والكفاءة الذاتية بين الأجيال وإمكانات الفرد الفكرية والعاطفية. كما أن منظمة الصحة العالمية نصت على أن رفاهية الفرد تشمل القدرة على إدراك قدراتهم والتعامل مع ضغوط الحياة العادية والإنتاج ومساعدة المجتمع. ومع ذلك فإن تعريف \"الصحة العقلية\" تختلف نتيجةََ للاختلاف الثقافي والتقييم الذاتي والتنافس في النظريات\". الصحة السلوكية هي المصطلح الأمثل للصحة العقلية. وهي تعتبر حالة من العافية يستطيع فيها كل فرد إدراك إمكاناته الخاصة والتكيّف مع حالات التوتّر العادية والعمل بشكل منتج ومفيد والإسهام في مجتمعه المحلي. والصحة هي حالة من اكتمال السلامة بدنياً وعقلياً واجتماعياً، لا مجرّد انعدام المرض.\r\n\r\nالشخص الذي يعاني من اضطراب في حالته الصحية السلوكية يواجه مشاكل عديدة، لعل أبرزها الإجهاد والاكتئاب والقلق ومشاكل في علاقاته مع الآخرين وقد يعاني من الحزن والإدمان وقصور الانتباه وفرط الحركة وصعوبات في التعلم واضطراب المزاج واضطرابات نفسية أخرى. يمكن للمرشدين النفسيين والمعالجين ومدربي الحياة وعلماء النفس ومزاولي مهنة التمريض والأطباء أن يساعدوا في إدارة المخاوف الصحية السلوكية عن طريق معالجتها بطرق مثل جلسات العلاج أو الاستشارة أو المداواة الميدان الجديد للصحة النفسية العالمية هو «مجال الدراسة والبحث والخبرة والذي يضع الأولوية لتحسين الصحة العقلية وتحقيق الإنصاف في مجال الصحة العقلية لجميع الناس في العالم»', '2025-03-20');

-- --------------------------------------------------------

--
-- بنية الجدول `user`
--

CREATE TABLE `user` (
  `id` int(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `momid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `momid`) VALUES
(1, 'محمد', 'السطوف', 1),
(3, 'احمد', 'منير', 2),
(7, 'صفوان', 'العوض', 1),
(8, 'مصطفى', 'المصطفى', 2),
(15, 'محمد', 'السطوف', 2),
(19, 'منير ', 'عويص', 5),
(22, '123', '456', 40),
(23, '9999', '8888', 43);

-- --------------------------------------------------------

--
-- بنية الجدول `vaccine`
--

CREATE TABLE `vaccine` (
  `id` int(11) NOT NULL,
  `vaccinePrefix` varchar(255) NOT NULL,
  `vaccineNext` varchar(255) NOT NULL,
  `timePrefix` date NOT NULL,
  `timeNext` date NOT NULL,
  `childusers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `vaccine`
--

INSERT INTO `vaccine` (`id`, `vaccinePrefix`, `vaccineNext`, `timePrefix`, `timeNext`, `childusers`) VALUES
(1, 'كزاز', 'شلل اطفال', '2025-03-01', '2025-03-03', 1),
(2, 'رز بحليب', 'كازوز', '2025-03-06', '2025-03-27', 1),
(3, 'عضال', 'انفلونزا', '2025-03-05', '2025-03-06', 7),
(4, 'ادرينالين', 'فاسيكس', '2025-03-06', '2025-03-19', 1),
(5, 'فاسيكس', 'فاسيكس', '2025-03-07', '2025-03-15', 1),
(12, 'فاسيكس', 'فاسيكس', '2025-03-03', '2025-03-31', 1),
(13, 'فاسيكس', 'فاسيكس', '2025-03-07', '2025-03-14', 1);

-- --------------------------------------------------------

--
-- بنية الجدول `vaccinecampaignschedule`
--

CREATE TABLE `vaccinecampaignschedule` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `datevaccin` date NOT NULL,
  `city` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `vaccinecampaignschedule`
--

INSERT INTO `vaccinecampaignschedule` (`id`, `name`, `datevaccin`, `city`, `location`) VALUES
(1, 'كورونا ', '2025-03-31', 'حلب ', 'السكري جامع عباد '),
(2, 'كزاز', '2025-04-23', 'ادلب', 'دوار المحراب');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `awarenesssessions`
--
ALTER TABLE `awarenesssessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `centernmae`
--
ALTER TABLE `centernmae`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `citycenter` (`citycenter`);

--
-- Indexes for table `cityname`
--
ALTER TABLE `cityname`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `num` (`num`);

--
-- Indexes for table `familyplanningarticle`
--
ALTER TABLE `familyplanningarticle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namearticle` (`namearticle`);

--
-- Indexes for table `mother`
--
ALTER TABLE `mother`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idnational` (`num`);

--
-- Indexes for table `mothervaccines`
--
ALTER TABLE `mothervaccines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `momid` (`momid`);

--
-- Indexes for table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usernote` (`usernote`);

--
-- Indexes for table `reproductivehealtharticle`
--
ALTER TABLE `reproductivehealtharticle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `mom id` (`momid`);

--
-- Indexes for table `vaccine`
--
ALTER TABLE `vaccine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `childusers` (`childusers`);

--
-- Indexes for table `vaccinecampaignschedule`
--
ALTER TABLE `vaccinecampaignschedule`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `awarenesssessions`
--
ALTER TABLE `awarenesssessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `centernmae`
--
ALTER TABLE `centernmae`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cityname`
--
ALTER TABLE `cityname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `emp`
--
ALTER TABLE `emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `familyplanningarticle`
--
ALTER TABLE `familyplanningarticle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mother`
--
ALTER TABLE `mother`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `mothervaccines`
--
ALTER TABLE `mothervaccines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `reproductivehealtharticle`
--
ALTER TABLE `reproductivehealtharticle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vaccine`
--
ALTER TABLE `vaccine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vaccinecampaignschedule`
--
ALTER TABLE `vaccinecampaignschedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- قيود الجداول المُلقاة.
--

--
-- قيود الجداول `centernmae`
--
ALTER TABLE `centernmae`
  ADD CONSTRAINT `centernmae_ibfk_1` FOREIGN KEY (`citycenter`) REFERENCES `cityname` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `mothervaccines`
--
ALTER TABLE `mothervaccines`
  ADD CONSTRAINT `mothervaccines_ibfk_1` FOREIGN KEY (`momid`) REFERENCES `mother` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`usernote`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`momid`) REFERENCES `mother` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `vaccine`
--
ALTER TABLE `vaccine`
  ADD CONSTRAINT `vaccine_ibfk_1` FOREIGN KEY (`childusers`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
