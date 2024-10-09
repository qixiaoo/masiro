import 'package:flutter/material.dart';
import 'package:masiro/data/repository/model/volume.dart';
import 'package:masiro/misc/context.dart';

class VolumeList extends StatefulWidget {
  final List<Volume> volumes;
  final int lastReadChapterId;
  final void Function(Chapter c, Volume v) onTap;

  const VolumeList({
    super.key,
    required this.volumes,
    required this.lastReadChapterId,
    required this.onTap,
  });

  @override
  State<VolumeList> createState() => _VolumeListState();
}

class _VolumeListState extends State<VolumeList> {
  late final List<_VolumePanel> panels;

  @override
  void initState() {
    super.initState();
    panels = widget.volumes.map((v) {
      final lastReadChapterId = widget.lastReadChapterId;
      final index = v.chapters.indexWhere((c) => c.id == lastReadChapterId);
      return _VolumePanel(volume: v, isExpanded: index != -1);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          panels[index].isExpanded = isExpanded;
        });
      },
      children: panels
          .asMap()
          .map((index, panel) {
            final expansionPanel = buildExpansionPanel(context, index, panel);
            return MapEntry(index, expansionPanel);
          })
          .values
          .toList(),
    );
  }

  ExpansionPanel buildExpansionPanel(
    BuildContext context,
    int index,
    _VolumePanel panel,
  ) {
    final textTheme = context.textTheme();
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(
            panel.volume.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          onTap: () => setState(() {
            panels[index].isExpanded = !panels[index].isExpanded;
          }),
        );
      },
      body: Column(
        children: panel.volume.chapters.map((c) {
          return ListTile(
            title: Text(
              c.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: buildListTileTrailing(context, c.limitLv, c.cost),
            selected: c.id == widget.lastReadChapterId,
            onTap: () => widget.onTap(c, panel.volume),
          );
        }).toList(),
      ),
      isExpanded: panel.isExpanded,
    );
  }

  Widget? buildListTileTrailing(BuildContext context, int limitLv, int cost) {
    final localizations = context.localizations();
    if (limitLv == 0 && cost > 0) {
      return Text('${cost}G');
    }
    if (limitLv > 0 && cost == 0) {
      return IconButton(
        tooltip: localizations.levelLimitMessage(limitLv),
        onPressed: () {},
        icon: const Icon(Icons.info_outline_rounded),
      );
    }
    if (limitLv > 0 && cost > 0) {
      return IconButton(
        tooltip: localizations.levelLimitAndCostMessage(cost, limitLv),
        onPressed: () {},
        icon: const Icon(Icons.info_outline_rounded),
      );
    }
    return null;
  }
}

class _VolumePanel {
  Volume volume;
  bool isExpanded;

  _VolumePanel({
    required this.volume,
    this.isExpanded = false,
  });
}
